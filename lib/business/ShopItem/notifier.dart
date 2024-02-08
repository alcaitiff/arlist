import 'package:ar_list/business/ShopItem/event.dart';
import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/repositories/shop_item_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'state.dart';

class ShopItemNotifier extends StateNotifier<ShopItemState> {
  final ShopItemRepository _repository;

  @override
  ShopItemNotifier(this._repository) : super(ShopItemUnloadedState());

  Future<void> event(ShopItemEvent event) async {
    state = ShopItemFetchingState();
    Set<ShopItem> item = new Set();
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
      }
      if (item.length == 0) {
        state = ShopItemEmptyState();
      } else {
        state = ShopItemFetchedState(item);
      }
    } catch (_) {
      state = ShopItemErrorState();
    }
  }
}
