import 'dart:convert';

import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/providers/json_provider.dart';

class ShopItemProvider {
  static const fileName = 'shop_item.json';
  static final ShopItemProvider instance = ShopItemProvider._();
  Set<ShopItem> data;

  ShopItemProvider._() {
    this.read();
  }

  Future<Set<ShopItem>> read() async {
    try {
      final jsonString = await JsonProvider.readFile(ShopItemProvider.fileName);
      this.data = (json.decode(jsonString) as List)
          .map((i) => ShopItem.fromJson(i))
          .toSet();
    } catch (error) {
      this.data = <ShopItem>{};
      this.write();
    }
    return this.data;
  }

  Future<void> write() async {
    await JsonProvider.saveFile(
        ShopItemProvider.fileName, json.encode(this.data.toList()));
  }

  Future<void> clear() async {
    await JsonProvider.deleteFile(ShopItemProvider.fileName);
  }
}
