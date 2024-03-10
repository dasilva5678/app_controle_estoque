import 'package:app_controle_estoque/controllers/create_account_controller.dart';
import 'package:app_controle_estoque/controllers/home_controller.dart';
import 'package:app_controle_estoque/controllers/login_controller.dart';
import 'package:app_controle_estoque/controllers/stock_controller.dart';
import 'package:app_controle_estoque/core/hive/initialization_hive.dart';
import 'package:app_controle_estoque/services/audit_service.dart';
import 'package:app_controle_estoque/services/login_state.dart';
import 'package:app_controle_estoque/services/save_user_cache.dart';
import 'package:app_controle_estoque/services/user_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void dependencies() {
  getIt.registerFactory(() => HiveInitialization());

  //controllers
  getIt.registerFactory(() => LoginController(
        userService: getIt<UserService>(),
        saveUserCache: getIt<SaveUserCache>(),
        loginState: getIt<LoginState>(),
      ));
  getIt.registerFactory(() => CreateAccountController(
        userService: getIt<UserService>(),
      ));
  getIt.registerFactory(() => HomeController(
        saveUserCache: getIt<SaveUserCache>(),
        loginState: getIt<LoginState>(),
        auditService: getIt<AuditService>(),
      ));
  getIt.registerFactory(() => StockController());

  //services
  getIt.registerFactory(() => UserService());
  getIt.registerFactory(() => LoginState());
  getIt.registerFactory(() => SaveUserCache());
  getIt.registerFactory(() => AuditService());
}
