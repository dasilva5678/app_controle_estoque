import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/models/audit_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeBase with _$HomeController;

abstract class HomeBase with Store {
  @observable
  List<AuditModel> auditList = [];

  @observable
  List<AuditModel> productList = [];

  @action
  Color getColor(String status) {
    if (status == "Pendente") {
      return Colors.red;
    } else {
      return AppColors.blue;
    }
  }
}
