// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopItem _$ShopItemFromJson(Map<String, dynamic> json) {
  return ShopItem(
    json['name'] as String,
    json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShopItemToJson(ShopItem instance) => <String, dynamic>{
      'name': instance.name,
      'category': instance.category?.toJson(),
    };
