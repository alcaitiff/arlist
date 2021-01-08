import 'package:ar_list/models/shop_list.dart';

abstract class ShopListState {}

class ShopListFetchedState extends ShopListState {
  final Set<ShopList> list;
  ShopListFetchedState(this.list);
}

class ShopListFetchingState extends ShopListState {}

class ShopListUnloadedState extends ShopListState {}

class ShopListEmptyState extends ShopListState {}

class ShopListErrorState extends ShopListState {}
