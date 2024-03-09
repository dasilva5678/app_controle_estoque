import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveInitialization {
  static Future<void> startConnection() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }
}
