import 'dart:convert';

import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers/json_provider.dart';

class CategoryProvider {
  static const fileName = 'category.json';
  static Future<Set<Category>> readCategories() async {
    final jsonString = await JsonProvider.readFile(CategoryProvider.fileName);
    return (json.decode(jsonString) as List)
        .map((i) => Category.fromJson(i))
        .toSet();
  }

  static void writeCategories(Set<Category> categories) {
    JsonProvider.saveFile(
        CategoryProvider.fileName, json.encode(categories.toList()));
  }
}
