import 'dart:convert';

import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/repositories/json_repository.dart';

class ShopListRepository {
  static const fileName = 'shop_list.json';
  static final ShopListRepository instance = ShopListRepository._();
  Set<ShopList> data;

  ShopListRepository._();

  Future<Set<ShopList>> add(ShopList list) async {
    if (this.data == null) {
      await this.read();
    }
    this.data.add(list);
    return this.write();
  }

  Future<Set<ShopList>> removeAt(int i) async {
    if (this.data == null) {
      await this.read();
    }
    this.data.remove(this.data.elementAt(i));
    return this.write();
  }

  Future<Set<ShopList>> read() async {
    try {
      final jsonString =
          await JsonRepository.readFile(ShopListRepository.fileName);
      this.data = (json.decode(jsonString) as List)
          .map((i) => ShopList.fromJson(i))
          .toSet();
    } catch (error) {
      this.data = <ShopList>{};
      this.write();
    }
    return this.data;
  }

  Future<Set<ShopList>> write() async {
    await JsonRepository.saveFile(
        ShopListRepository.fileName, json.encode(this.data.toList()));
    return this.data;
  }

  Future<Set<ShopList>> clear() async {
    await JsonRepository.deleteFile(ShopListRepository.fileName);
    return <ShopList>{};
  }
}
