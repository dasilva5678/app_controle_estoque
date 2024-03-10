
import 'package:app_controle_estoque/models/user_model.dart';
import 'package:hive/hive.dart';

class SaveUserCache {
  late Box userCacheBox;

  Future<void> startUserCacheBox() async {
    userCacheBox = await Hive.openBox('userCache');
  }

  Future<void> saveUserCacheBox(UserModel user) async {
    await startUserCacheBox();
    print(user.toMap());
    final userCache = UserModel(
      email: user.email,
      id: user.id,
      name: user.name,
      phone: user.phone,
    );
    await userCacheBox.put('userCache', userCache.toMap());
  }

  Future<UserModel?> getUserCacheBox() async {
    await startUserCacheBox();

    final userCache = await userCacheBox.get('userCache');
    if (userCache != null) {
      return UserModel.fromMap(userCache);
    }
    return null;
  }

  Future<void> deleteUserCacheBox() async {
    await startUserCacheBox();
    await userCacheBox.delete('userCache');
  }

  Future<bool> hasUserCacheBox() async {
    await startUserCacheBox();

    final userCache = await userCacheBox.get('userCache');
    if (userCache != null) {
      return true;
    }
    return false;
  }
}
