import 'package:ar_list/models/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopItem implements Comparable {
  String name;
  Category? category;

  ShopItem(this.name, this.category);

  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);

  Map<String, dynamic> toJson() => _$ShopItemToJson(this);

  @override
  int compareTo(other) {
    if (this.category == other.category) {
      return this
          .name
          .toLowerCase()
          .compareTo(other.name.toString().toLowerCase());
    } else {
      return this.category!.compareTo(other.category);
    }
  }

  @override
  bool operator ==(other) {
    return this.compareTo(other) == 0;
  }

  @override
  int get hashCode {
    return this.category.hashCode + this.name.hashCode;
  }
}
