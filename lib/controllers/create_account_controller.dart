import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'create_account_controller.g.dart';

class CreateAccountController = CreateAccountBase
    with _$CreateAccountController;

abstract class CreateAccountBase with Store {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @observable
  String name = '';
}
