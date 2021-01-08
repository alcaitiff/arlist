import 'package:ar_list/business/ShopList/event.dart';
import 'package:hooks_riverpod/all.dart';

import 'state.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/repositories/shop_list_repository.dart';

class ShopListNotifier extends StateNotifier<ShopListState> {
  final ShopListRepository _repository;

  @override
  ShopListNotifier(this._repository) : super(ShopListUnloadedState());

  Future<void> event(ShopListEvent event) async {
    state = ShopListFetchingState();
    Set<ShopList> list;
    try {
      if (event is ReadEvent) {
        list = await _repository.read();
      } else if (event is WriteEvent) {
        list = await _repository.write();
      } else if (event is AddEvent) {
        list = await _repository.add(event.list);
      } else if (event is RemoveEvent) {
        list = await _repository.removeAt(event.i);
      }
      if (list.length == 0) {
        state = ShopListEmptyState();
      } else {
        state = ShopListFetchedState(list);
      }
    } catch (_) {
      state = ShopListErrorState();
    }
  }
}
