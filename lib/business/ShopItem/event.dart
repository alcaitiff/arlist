import 'package:ar_list/models/shop_item.dart';

abstract class ShopItemEvent {}

class WriteEvent extends ShopItemEvent {}

class ReadEvent extends ShopItemEvent {}

class ClearEvent extends ShopItemEvent {}

class AddEvent extends ShopItemEvent {
  final ShopItem item;
  AddEvent(this.item);
}

class RemoveEvent extends ShopItemEvent {
  final ShopItem item;
  RemoveEvent(this.item);
}

class RemoveAtEvent extends ShopItemEvent {
  final int i;
  RemoveAtEvent(this.i);
}
