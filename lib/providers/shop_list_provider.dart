import 'dart:convert';

import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers/json_provider.dart';

class ShopListProvider {
  static const fileName = 'shop_item.json';
  static final ShopListProvider instance = ShopListProvider._();
  Set<ShopList> data;

  ShopListProvider._() {
    this.read();
  }

  Future<Set<ShopList>> read() async {
    try {
      final jsonString = await JsonProvider.readFile(ShopListProvider.fileName);
      this.data = (json.decode(jsonString) as List)
          .map((i) => ShopList.fromJson(i))
          .toSet();
    } catch (error) {
      this.data = <ShopList>{};
      this.write();
    }
    return this.data;
  }

  Future<void> write() async {
    await JsonProvider.saveFile(
        ShopListProvider.fileName, json.encode(this.data.toList()));
  }

  Future<void> clear() async {
    await JsonProvider.deleteFile(ShopListProvider.fileName);
  }
}
