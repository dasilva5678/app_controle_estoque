import 'package:app_controle_estoque/models/audit_model.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeBase with _$HomeController;

abstract class HomeBase with Store {

@observable
List<AuditModel> auditList = [];

@observable
List<AuditModel> productList = [];

}
