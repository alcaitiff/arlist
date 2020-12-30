import 'package:ar_list/models/shop_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_list.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopList {
  String name;
  Set<ShopItem> items = <ShopItem>{};

  ShopList(this.name);

  factory ShopList.fromJson(Map<String, dynamic> json) =>
      _$ShopListFromJson(json);

  Map<String, dynamic> toJson() => _$ShopListToJson(this);

  ShopList addItem(ShopItem item) {
    this.items.add(item);
    return this;
  }

  ShopList removeItem(ShopItem item) {
    this.items.remove(item);
    return this;
  }
}
