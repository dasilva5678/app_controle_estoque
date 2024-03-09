import 'package:app_controle_estoque/controllers/create_account_controller.dart';
import 'package:app_controle_estoque/controllers/login_controller.dart';
import 'package:app_controle_estoque/core/hive/initialization_hive.dart';
import 'package:app_controle_estoque/services/login_state.dart';
import 'package:app_controle_estoque/services/user_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void dependencies() {
  getIt.registerFactory(() => HiveInitialization());

  //controllers
  getIt.registerFactory(() => LoginControler(
        userService: getIt<UserService>(),
        loginState: getIt<LoginState>(),
      ));
  getIt.registerFactory(() => CreateAccountController(
        userService: getIt<UserService>(),
      ));

  //services
  getIt.registerFactory(() => UserService());
  getIt.registerFactory(() => LoginState());
}
