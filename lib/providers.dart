import 'package:ar_list/business/ShopItem/notifier.dart';
import 'package:ar_list/business/ShopList/notifier.dart';
import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/repositories/shop_item_repository.dart';
import 'package:ar_list/repositories/shop_list_repository.dart';
import 'package:hooks_riverpod/all.dart';

final shopListRepositoryProvider = Provider<ShopListRepository>(
  (ref) => ShopListRepository.instance,
);

final shopListNotifierProvider = StateNotifierProvider(
  (ref) => ShopListNotifier(ref.watch(shopListRepositoryProvider)),
);

final shopItemRepositoryProvider = Provider<ShopItemRepository>(
  (ref) => ShopItemRepository.instance,
);

final shopItemNotifierProvider = StateNotifierProvider(
  (ref) => ShopItemNotifier(ref.watch(shopItemRepositoryProvider)),
);

final shopItemFilter = StateProvider((ref) => '');

enum SortType {
  alpha,
  inversedAlpha,
}

final shopItemSortType = StateProvider((ref) => SortType.alpha);

final filteredShopItems = Provider<List<ShopItem>>((ref) {
  final filter = ref.watch(shopItemFilter);
  final items = ref.watch(shopItemRepositoryProvider).data;
  final sortType = ref.watch(shopItemSortType);

  if (items != null && items.length > 0) {
    final result =
        items.where((item) => item.name.contains(filter.state)).toList();
    if (sortType.state == SortType.alpha) {
      result.sort((a, b) {
        return a.name.compareTo(b.name);
      });
    } else if (sortType.state == SortType.inversedAlpha) {
      result.sort((a, b) {
        return b.name.compareTo(a.name);
      });
    }
    return result;
  } else {
    return [];
  }
});
