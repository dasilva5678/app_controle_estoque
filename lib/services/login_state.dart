import 'package:app_controle_estoque/core/errors/custom_exception.dart';
import 'package:hive/hive.dart';

class LoginState {
  late Box stateLogin;

  Future<void> startBox() async {
    stateLogin = await Hive.openBox('stateLogin');
  }

  Future<bool> checkStateLogin() async {
    try {
      await startBox();
      final state = await stateLogin.get('stateLogin');

      if (state == null) {
        return false;
      }

      return state as bool;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<bool> setStateLogin(bool value) async {
    try {
      await startBox();
      bool state = value;

      await stateLogin.put('stateLogin', state);
      return state;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }
}
