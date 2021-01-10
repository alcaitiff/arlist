import 'package:ar_list/models/shop_item.dart';

abstract class ShopItemState {}

class ShopItemFetchedState extends ShopItemState {
  final Set<ShopItem> item;
  ShopItemFetchedState(this.item);
}

class ShopItemFetchingState extends ShopItemState {}

class ShopItemUnloadedState extends ShopItemState {}

class ShopItemEmptyState extends ShopItemState {}

class ShopItemErrorState extends ShopItemState {}
