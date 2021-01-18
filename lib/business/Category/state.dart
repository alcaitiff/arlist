import 'package:ar_list/models/category.dart';

abstract class CategoryState {}

class CategoryFetchedState extends CategoryState {
  final Set<Category> item;
  CategoryFetchedState(this.item);
}

class CategoryFetchingState extends CategoryState {}

class CategoryUnloadedState extends CategoryState {}

class CategoryEmptyState extends CategoryState {}

class CategoryErrorState extends CategoryState {}
