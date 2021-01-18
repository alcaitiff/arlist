import 'package:ar_list/models/category.dart';

abstract class CategoryEvent {}

class WriteEvent extends CategoryEvent {}

class ReadEvent extends CategoryEvent {}

class ClearEvent extends CategoryEvent {}

class AddEvent extends CategoryEvent {
  final Category item;
  AddEvent(this.item);
}

class RemoveEvent extends CategoryEvent {
  final Category item;
  RemoveEvent(this.item);
}

class RemoveAtEvent extends CategoryEvent {
  final int i;
  RemoveAtEvent(this.i);
}
