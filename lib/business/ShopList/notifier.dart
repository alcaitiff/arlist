import 'dart:convert';

import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/repositories/shop_list_repository.dart';
import 'package:ar_list/services/compressor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'state.dart';

class ShopListNotifier extends StateNotifier<ShopListState> {
  final ShopListRepository _repository;

  @override
  ShopListNotifier(this._repository) : super(ShopListUnloadedState());

  ShopList listFromUrl(String url) {
    String text = url;
    String gzip = text.substring(text.indexOf('=') + 1);
    String stringData = Compressor().decompress(gzip);
    return ShopList.fromJson(json.decode(stringData));
  }

  Future<void> event(ShopListEvent event) async {
    state = ShopListFetchingState();
    Set<ShopList> list = new Set();
    try {
      if (event is ReadEvent) {
        list = await _repository.read();
      } else if (event is WriteEvent) {
        list = await _repository.write();
      } else if (event is AddEvent) {
        list = await _repository.add(event.list);
      } else if (event is ImportEvent) {
        list = await _repository.add(listFromUrl(event.url));
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
