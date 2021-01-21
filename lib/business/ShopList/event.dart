import 'package:ar_list/models/shop_list.dart';

abstract class ShopListEvent {}

class WriteEvent extends ShopListEvent {}

class ReadEvent extends ShopListEvent {}

class ClearEvent extends ShopListEvent {}

class AddEvent extends ShopListEvent {
  final ShopList list;
  AddEvent(this.list);
}

class ImportEvent extends ShopListEvent {
  final String url;
  ImportEvent(this.url);
}

class RemoveEvent extends ShopListEvent {
  final int i;
  RemoveEvent(this.i);
}
