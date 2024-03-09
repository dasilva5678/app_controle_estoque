// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/models/user_model.dart';
import 'package:app_controle_estoque/services/login_state.dart';
import 'package:app_controle_estoque/services/user_service.dart';
import 'package:app_controle_estoque/widgets/custom_showsnackbar.dart';

part 'login_controller.g.dart';

class LoginControler = LoginBase with _$LoginControler;

abstract class LoginBase with Store {
  final UserService userService;
  final LoginState loginState;
  LoginBase({
    required this.userService,
    required this.loginState,
  });

  @observable
  UserModel user = UserModel();

  @observable
  String email = '';

  @observable
  bool isLoading = false;

  @observable
  bool isObscure = true;

  @observable
  bool isCheckLoginState = false;

  @action
  void setObscure() {
    isObscure = !isObscure;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<UserModel> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    setLoading(true);
    final result = await userService
        .login(
      email: email,
      password: password,
    )
        .onError(
      (error, stackTrace) async {
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

        await loginState.setStateLogin(false);

        return UserModel();
      },
    );

    print("Usuário logado com sucesso!");
    print("Result: ${result.toMap()}");
    setLoading(false);

    NavigationService.instance.navigateTo(EnumRoutes.home);
    await loginState.setStateLogin(true);
    return result;
  }

  @action
  Future<dynamic> checkStateLogin() async {
    isCheckLoginState = await loginState.checkStateLogin();
    if (isCheckLoginState) {
      NavigationService.instance.navigateTo(EnumRoutes.home);
    } else {
      NavigationService.instance.navigateTo(EnumRoutes.login);
    }
  }

  @action
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }
}
