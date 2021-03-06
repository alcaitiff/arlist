import 'dart:io';

import 'package:path_provider/path_provider.dart';

class JsonRepository {
  static Future<String> readFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    return await file.readAsString();
  }

  static Future<void> saveFile(String fileName, String content) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(content);
  }

  static Future<bool> deleteFile(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName');
      await file.delete();
      return true;
    } catch (on) {
      return false;
    }
  }
}
