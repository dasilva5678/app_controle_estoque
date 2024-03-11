// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/widgets/custom_showsnackbar.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/models/audit_model.dart';
import 'package:app_controle_estoque/models/user_model.dart';
import 'package:app_controle_estoque/services/audit_service.dart';
import 'package:app_controle_estoque/services/login_state.dart';
import 'package:app_controle_estoque/services/save_user_cache.dart';

part 'home_controller.g.dart';

class HomeController = HomeBase with _$HomeController;

abstract class HomeBase with Store {
  final SaveUserCache saveUserCache;
  final LoginState loginState;
  final AuditService auditService;
  HomeBase({
    required this.saveUserCache,
    required this.loginState,
    required this.auditService,
  });

  @observable
  UserModel userCache = UserModel();

  @observable
  AuditModel auditModel = AuditModel();

  List<String> status = [
    "Pendente",
    "Enviado",
  ];

  @observable
  List<AuditModel> auditList = [];

  @observable
  List<AuditModel> productList = [];

  @observable
  List<AuditModel> pendingList = [];

  @observable
  List<AuditModel> sentList = [];

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> getLocalUser() async {
    final getUser = await saveUserCache.getUserCacheBox();
    if (getUser != null) {
      userCache = getUser;
    }
  }

  @action
  Future<void> logout() async {
    await loginState.setStateLogin(false);

    final userExists = await saveUserCache.hasUserCacheBox();

    if (userExists) {
      await saveUserCache.deleteUserCacheBox();
    }
    final isCheckLoged = await loginState.checkStateLogin();

    if (!isCheckLoged) {
      NavigationService.instance.navigateTo(EnumRoutes.login);
    }
  }

  @action
  void setSendList(List<AuditModel> value) {
    sentList = value;
  }

  @action
  void setPendingList(List<AuditModel> value) {
    pendingList = value;
  }

  @action
  Future<void> createAudit({
    required String? userID,
    required String? status,
    required String? unit,
    required String? date,
    required BuildContext context,
  }) async {
    final audit = AuditModel(
      userID: userID,
      status: status,
      unit: unit,
      date: date,
    );
    setLoading(true);
    final result = await auditService.createAudit(audit).onError(
      (error, stackTrace) {
        print(error.toString());
        print(stackTrace.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Aviso',
            label: error.toString(),
            icon: Icons.check_circle_outline,
            textColorLabel: Colors.white,
            backgroundColor: Colors.red,
          ),
        );
        setLoading(false);
        return {};
      },
    );
    if (result.isNotEmpty) {
      print("Result: ${result}");
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Sucesso',
          label: 'Auditoria criada com sucesso',
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: AppColors.darkBlue,
        ),
      );
      print("Result: ${result}");
      setLoading(false);
      NavigationService.instance.navigateTo(EnumRoutes.home);
    } else {
      print("Erro ao criar Auditoria, tente novamente!");
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Aviso',
          label: 'Erro ao criar Auditoria, tente novamente!',
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: Colors.red,
        ),
      );
      setLoading(false);
    }
  }

  Future<void> getAllAudit(BuildContext context) async {
    auditList.clear();
    productList.clear();
    pendingList.clear();
    sentList.clear();

    setLoading(true);
    final result = await auditService.getAllAudit().onError(
      (error, stackTrace) {
        print(error.toString());
        print(stackTrace.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Aviso',
            label: error.toString(),
            icon: Icons.check_circle_outline,
            textColorLabel: Colors.white,
            backgroundColor: Colors.red,
          ),
        );
        setLoading(false);
        return [];
      },
    );

    if (result.isNotEmpty) {
      auditList = result;

      setPendingList(
        result
            .where((element) => element.status!.toLowerCase() == "pendente")
            .toList(),
      );
      setSendList(
        result
            .where((element) => element.status!.toLowerCase() == "enviado")
            .toList(),
      );

      setLoading(false);
    }
  }

  Future<void> deleteAudit(String id, BuildContext context) async {
    setLoading(true);
    final result = await auditService.deleteAudit(id).onError(
      (error, stackTrace) {
        print(error.toString());
        print(stackTrace.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Aviso',
            label: error.toString(),
            icon: Icons.check_circle_outline,
            textColorLabel: Colors.white,
            backgroundColor: Colors.red,
          ),
        );
        setLoading(false);
        return false;
      },
    );
    if (result) {
      getAllAudit(context);
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Sucesso',
          label: "Auditoria deletada com sucesso",
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: AppColors.blue,
        ),
      );
      setLoading(false);
    }
  }

  @action
  Future<void> getAudit(
    String auditId,
    BuildContext context,
  ) async {
    setLoading(true);

    final result = await auditService.getAudit(auditId).onError(
      (error, stackTrace) {
        print(error.toString());
        print(stackTrace.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Aviso',
            label: error.toString(),
            icon: Icons.check_circle_outline,
            textColorLabel: Colors.white,
            backgroundColor: Colors.red,
          ),
        );
        setLoading(false);
        return AuditModel();
      },
    );

    auditModel = result;
    setLoading(false);
  }

  @action
  Future<void> updateAudit({
    required BuildContext context,
    String? id,
    String? userID,
    String? status,
    String? unit,
    String? date,
  }) async {
    setLoading(true);

    final updateAuditModel = AuditModel(
      id: id,
      userID: userID,
      status: status,
      unit: unit,
      date: date,
    );
    final result = await auditService
        .updateAudit(updateAuditModel)
        .onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Aviso',
          label: error.toString(),
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: Colors.red,
        ),
      );
      setLoading(false);
      return {};
    });
    if (result.isNotEmpty) {
      setLoading(false);
      getAllAudit(context);
      NavigationService.instance.navigateTo(EnumRoutes.home);
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Sucesso',
          label: "Auditoria atualizada com sucesso",
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: AppColors.blue,
        ),
      );
    }
  }

  @action
  Color getColor(String status) {
    if (status == "Pendente") {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
