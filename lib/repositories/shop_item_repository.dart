import 'dart:convert';

import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/repositories/json_repository.dart';

class ShopItemRepository {
  static const fileName = 'shop_item.json';
  static final ShopItemRepository instance = ShopItemRepository._();
  Set<ShopItem> data;

  ShopItemRepository._();

  Future<Set<ShopItem>> add(ShopItem item) async {
    if (this.data == null) {
      await this.read();
    }
    this.data.add(item);
    return this.write();
  }

  Future<Set<ShopItem>> removeAt(int i) async {
    if (this.data == null) {
      await this.read();
    }
    this.data.remove(this.data.elementAt(i));
    return this.write();
  }

  Future<Set<ShopItem>> remove(ShopItem item) async {
    if (this.data == null) {
      await this.read();
    }
    print('removing: ${item.toJson()}');
    this.data.remove(item);
    return this.write();
  }

  Future<Set<ShopItem>> read() async {
    try {
      final jsonString =
          await JsonRepository.readFile(ShopItemRepository.fileName);
      this.data = (json.decode(jsonString) as List)
          .map((i) => ShopItem.fromJson(i))
          .toSet();
    } catch (error) {
      this.data = <ShopItem>{};
      this.write();
    }
    return this.data;
  }

  Future<Set<ShopItem>> write() async {
    await JsonRepository.saveFile(
        ShopItemRepository.fileName, json.encode(this.data.toList()));
    return this.data;
  }

  Future<Set<ShopItem>> clear() async {
    await JsonRepository.deleteFile(ShopItemRepository.fileName);
    return <ShopItem>{};
  }
}
