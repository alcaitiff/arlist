// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopList _$ShopListFromJson(Map<String, dynamic> json) {
  return ShopList(
    json['name'] as String,
  )..items = (json['items'] as List)
      ?.map((e) =>
          e == null ? null : ShopListEntry.fromJson(e as Map<String, dynamic>))
      ?.toSet();
}

Map<String, dynamic> _$ShopListToJson(ShopList instance) => <String, dynamic>{
      'name': instance.name,
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };
