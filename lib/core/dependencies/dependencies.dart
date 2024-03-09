import 'package:app_controle_estoque/controllers/login_controller.dart';
import 'package:app_controle_estoque/core/hive/initialization_hive.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void dependencies() {
  getIt.registerFactory(() => HiveInitialization());

  //controllers
  getIt.registerFactory(() => LoginControler());
}
