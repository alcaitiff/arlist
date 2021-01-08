import 'dart:convert';

import 'package:ar_list/models/category.dart';
import 'package:ar_list/repositories/json_repository.dart';

class CategoryRepository {
  static const fileName = 'category.json';
  static final CategoryRepository instance = CategoryRepository._();
  Set<Category> data;

  CategoryRepository._();

  Future<Set<Category>> read() async {
    try {
      final jsonString =
          await JsonRepository.readFile(CategoryRepository.fileName);
      this.data = (json.decode(jsonString) as List)
          .map((i) => Category.fromJson(i))
          .toSet();
    } catch (error) {
      this.data = <Category>{};
      this.write();
    }
    return this.data;
  }

  Future<Set<Category>> write() async {
    await JsonRepository.saveFile(
        CategoryRepository.fileName, json.encode(this.data.toList()));
    return this.data;
  }

  Future<Set<Category>> clear() async {
    await JsonRepository.deleteFile(CategoryRepository.fileName);
    return this.data;
  }
}
