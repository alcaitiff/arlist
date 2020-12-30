import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_list.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopList {
  String name;
  Set<ShopListEntry> items = <ShopListEntry>{};

  ShopList(this.name);

  factory ShopList.fromJson(Map<String, dynamic> json) =>
      _$ShopListFromJson(json);

  Map<String, dynamic> toJson() => _$ShopListToJson(this);

  ShopList addEntry(ShopListEntry entry) {
    this.items.add(entry);
    return this;
  }

  ShopList removeItem(ShopListEntry entry) {
    this.items.remove(entry);
    return this;
  }
}
