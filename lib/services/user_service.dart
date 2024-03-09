import 'package:app_controle_estoque/core/errors/custom_exception.dart';
import 'package:app_controle_estoque/models/user_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class UserService {
  late Box userBox;

  Future<void> startUserBox() async {
    userBox = await Hive.openBox('users');
  }

  Future<Map<String, dynamic>> createUser({
    required String nome,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      await startUserBox();
      final user = UserModel(
        id: const Uuid().v1(),
        name: nome,
        email: email,
        password: password,
        phone: phone,
      );

      final findEmailExists = await emailExists(email);

      if (findEmailExists) {
        throw EmailAlreadyExists();
      }

      await userBox.put(user.id, user.toMap());

      return userBox.get(user.id);
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    try {
      await startUserBox();

      final userList = await getUsers();
      UserModel userModel = UserModel();

      final findEmailExists = await emailExists(email);

      for (var user in userList) {
        if (user.email == email && user.password == password) {
          return userModel = user;
        }

        if (user.email == email && user.password != password) {
          throw PasswordNotMatch();
        }
      }

      if (!findEmailExists) {
        throw EmailNotFound();
      }

      return userModel;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }

      throw ExceptionRequest();
    }
  }

  Future<void> getUser() async {
    userBox = await Hive.openBox('users');
  }

  Future<List<UserModel>> getUsers() async {
    await startUserBox();

    List<UserModel> usersList = [];

    final users = await userBox.toMap();

    users.forEach((key, value) {
      usersList.add(UserModel.fromMap(value));
    });

    return usersList;
  }

  Future<bool> emailExists(String email) async {
    bool exists = false;

    await startUserBox();

    final user = await userBox.toMap();

    user.forEach((key, value) {
      if (value['email'] == email) {
        exists = true;
      }
    });

    return exists;
  }
}
