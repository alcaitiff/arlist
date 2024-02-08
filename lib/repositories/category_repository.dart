import 'dart:convert';

import 'package:ar_list/models/category.dart';
import 'package:ar_list/repositories/json_repository.dart';

class CategoryRepository {
  static const fileName = 'category.json';
  static final CategoryRepository instance = new CategoryRepository();
  late Set<Category> data;

  Future<Set<Category>> read() async {
    try {
      final jsonString =
          await JsonRepository.readFile(CategoryRepository.fileName);
      this.data = (json.decode(jsonString) as List)
          .map((i) => Category.fromJson(i))
          .toSet();
    } catch (error) {
      this.data = <Category>{};
      this.data.add(Category(''));
      this.write();
    }
    return this.data;
  }

  Future<Set<Category>> add(Category item) async {
    this.data.add(item);
    return this.write();
  }

  Future<Set<Category>> removeAt(int i) async {
    this.data.remove(this.data.elementAt(i));
    return this.write();
  }

  Future<Set<Category>> remove(Category item) async {
    this.data.remove(item);
    return this.write();
  }

  Future<Set<Category>> write() async {
    await JsonRepository.saveFile(
        CategoryRepository.fileName, json.encode(this.data.toList()));
    return this.data;
  }

  Future<Set<Category>> clear() async {
    this.data = <Category>{};
    this.data.add(Category(''));
    return this.write();
  }
}
