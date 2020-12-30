import 'package:ar_list/models/shop_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_list_entry.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopListEntry {
  ShopItem item;
  bool got = false;
  num quantity = 1;

  ShopListEntry(this.item);

  factory ShopListEntry.fromJson(Map<String, dynamic> json) =>
      _$ShopListEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ShopListEntryToJson(this);
}
