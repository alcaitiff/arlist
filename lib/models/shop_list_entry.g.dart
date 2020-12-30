// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_list_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopListEntry _$ShopListEntryFromJson(Map<String, dynamic> json) {
  return ShopListEntry(
    json['item'] == null
        ? null
        : ShopItem.fromJson(json['item'] as Map<String, dynamic>),
  )
    ..got = json['got'] as bool
    ..quantity = json['quantity'] as num;
}

Map<String, dynamic> _$ShopListEntryToJson(ShopListEntry instance) =>
    <String, dynamic>{
      'item': instance.item?.toJson(),
      'got': instance.got,
      'quantity': instance.quantity,
    };
