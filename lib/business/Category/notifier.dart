import 'package:ar_list/business/Category/event.dart';
import 'package:ar_list/models/category.dart';
import 'package:ar_list/repositories/category_repository.dart';
import 'package:hooks_riverpod/all.dart';

import 'state.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  final CategoryRepository _repository;

  @override
  CategoryNotifier(this._repository) : super(CategoryUnloadedState());

  Future<void> event(CategoryEvent event) async {
    state = CategoryFetchingState();
    Set<Category> item;
    try {
      if (event is ReadEvent) {
        item = await _repository.read();
      } else if (event is WriteEvent) {
        item = await _repository.write();
      } else if (event is AddEvent) {
        item = await _repository.add(event.item);
      } else if (event is RemoveAtEvent) {
        item = await _repository.removeAt(event.i);
      } else if (event is RemoveEvent) {
        item = await _repository.remove(event.item);
      } else if (event is ClearEvent) {
        item = await _repository.clear();
      }
      if (item.length == 0) {
        state = CategoryEmptyState();
      } else {
        state = CategoryFetchedState(item);
      }
    } catch (_) {
      state = CategoryErrorState();
    }
  }
}
