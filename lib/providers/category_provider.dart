import 'dart:convert';

import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers/json_provider.dart';

class CategoryProvider {
  static const fileName = 'category.json';
  static final CategoryProvider instance = CategoryProvider._();
  Set<Category> data;

  CategoryProvider._() {
    this.read();
  }

  Future<Set<Category>> read() async {
    try {
      final jsonString = await JsonProvider.readFile(CategoryProvider.fileName);
      this.data = (json.decode(jsonString) as List)
          .map((i) => Category.fromJson(i))
          .toSet();
    } catch (error) {
      this.data = <Category>{};
      this.write();
    }
    return this.data;
  }

  void write() {
    JsonProvider.saveFile(
        CategoryProvider.fileName, json.encode(this.data.toList()));
  }

  void clear() {
    JsonProvider.deleteFile(CategoryProvider.fileName);
  }
}
