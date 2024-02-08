import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_list.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopList {
  String name;
  Set<ShopListEntry?> items = <ShopListEntry>{};

  ShopList(this.name);

  factory ShopList.fromJson(Map<String, dynamic> json) =>
      _$ShopListFromJson(json);

  Map<String, dynamic> toJson() => _$ShopListToJson(this);

  ShopList clone() {
    return ShopList.fromJson(this.toJson());
  }

  bool contains(ShopItem item) {
    return this.items.map((e) => e!.item).contains(item);
  }

  ShopList addEntry(ShopListEntry entry) {
    this.items.add(entry);
    return this;
  }

  ShopList removeShopItem(ShopItem item) {
    this.items.removeWhere((e) => e!.item == item);
    return this;
  }

  ShopList addShopItem(ShopItem item) {
    this.items.add(ShopListEntry(item));
    return this;
  }

  ShopList removeItem(ShopListEntry entry) {
    this.items.remove(entry);
    return this;
  }
}
