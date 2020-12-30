import 'package:ar_list/models/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopItem {
  String name;
  Category category;

  ShopItem(this.name, this.category);

  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);

  Map<String, dynamic> toJson() => _$ShopItemToJson(this);
}
