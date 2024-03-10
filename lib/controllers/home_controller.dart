// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:app_controle_estoque/models/audit_model.dart';
import 'package:app_controle_estoque/models/user_model.dart';
import 'package:app_controle_estoque/services/login_state.dart';
import 'package:app_controle_estoque/services/save_user_cache.dart';

part 'home_controller.g.dart';

class HomeController = HomeBase with _$HomeController;

abstract class HomeBase with Store {
  final SaveUserCache saveUserCache;
  final LoginState loginState;
  HomeBase({
    required this.saveUserCache,
    required this.loginState,
  });

  @observable
  UserModel userCache = UserModel();

  @observable
  List<AuditModel> auditList = [];

  @observable
  List<AuditModel> productList = [];

  @observable
  List<AuditModel> pendingList = [];

  @observable
  List<AuditModel> sentList = [];

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
  Color getColor(String status) {
    if (status == "Pendente") {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
