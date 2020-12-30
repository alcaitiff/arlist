import 'dart:io';
import 'package:path_provider/path_provider.dart';

class JsonProvider {
  static readFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    return await file.readAsString();
  }

  static saveFile(String fileName, String content) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(content);
  }
}
