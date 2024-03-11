// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/widgets/custom_showsnackbar.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:app_controle_estoque/services/user_service.dart';
part 'create_account_controller.g.dart';

class CreateAccountController = CreateAccountBase
    with _$CreateAccountController;

abstract class CreateAccountBase with Store {
  final UserService userService;
  CreateAccountBase({
    required this.userService,
  });

  @observable
  bool isObscure = true;

  @observable
  bool isPasswordConfirmationObscureIcon = true;

  @observable
  bool isLoading = false;

  @action
  void setObscure() {
    isObscure = !isObscure;
  }

  @action
  void passwordConfirmationObscure() {
    isPasswordConfirmationObscureIcon = !isPasswordConfirmationObscureIcon;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> createAcount({
    required String name,
    required String phone,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    setLoading(true);
    final result = await userService
        .createUser(
      nome: name,
      phone: phone,
      email: email,
      password: password,
    )
        .onError(
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
      print("Usuário criado com sucesso!");
      print("Result: ${result}");
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Sucesso',
          label: 'Conta criada com sucesso',
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: AppColors.darkBlue,
        ),
      );
      setLoading(false);
      NavigationService.instance.navigateTo(EnumRoutes.login);
    } else {
      print("Erro ao criar conta, tente novamente!");
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Aviso',
          label: 'Erro ao criar conta, tente novamente!',
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: Colors.red,
        ),
      );
      setLoading(false);
    }
  }
}
