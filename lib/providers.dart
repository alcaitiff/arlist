import 'package:ar_list/business/Category/notifier.dart';
import 'package:ar_list/business/ShopItem/notifier.dart';
import 'package:ar_list/business/ShopList/notifier.dart';
import 'package:ar_list/models/category.dart';
import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/models/shop_list_entry.dart';
import 'package:ar_list/repositories/category_repository.dart';
import 'package:ar_list/repositories/shop_item_repository.dart';
import 'package:ar_list/repositories/shop_list_repository.dart';
import 'package:hooks_riverpod/all.dart';

final shopListRepositoryProvider = Provider<ShopListRepository>(
  (ref) => ShopListRepository.instance,
);

final shopListNotifierProvider = StateNotifierProvider(
  (ref) => ShopListNotifier(ref.watch(shopListRepositoryProvider)),
);

final categoryRepositoryProvider = Provider<CategoryRepository>(
  (ref) => CategoryRepository.instance,
);

final categoryNotifierProvider = StateNotifierProvider(
  (ref) => CategoryNotifier(ref.watch(categoryRepositoryProvider)),
);

final shopItemRepositoryProvider = Provider<ShopItemRepository>(
  (ref) => ShopItemRepository.instance,
);

final shopItemNotifierProvider = StateNotifierProvider(
  (ref) => ShopItemNotifier(ref.watch(shopItemRepositoryProvider)),
);

final shopItemFilter = StateProvider((ref) => '');

enum SortType { alpha, inversedAlpha, category }

final currentList = StateProvider<ShopList>((ref) => ShopList(''));

final currentCategory = StateProvider<Category>((ref) => Category(''));
final categoryFilter = StateProvider((ref) => '');

final entryFilter = StateProvider((ref) => '');
final entrySortType = StateProvider((ref) => SortType.alpha);

final filteredEntries = Provider<List<ShopListEntry>>((ref) {
  final filter = ref.watch(entryFilter);
  final items = ref.watch(currentList).state.items;
  final sortType = ref.watch(entrySortType);
  final category = ref.watch(currentCategory);
  if (items != null && items.length > 0) {
    final result = items
        .where((e) =>
            e.item.name.toLowerCase().contains(filter.state.toLowerCase()))
        .where((e) {
      return (e.item.category == null && category.state == null) ||
          category.state == null ||
          category.state.name == '' ||
          e.item.category == null ||
          e.item.category == category.state;
    }).toList();
    if (sortType.state == SortType.alpha) {
      result.sort((a, b) {
        return a.item.name
            .toLowerCase()
            .compareTo(b.item.name.toString().toLowerCase());
      });
    } else if (sortType.state == SortType.inversedAlpha) {
      result.sort((a, b) {
        return b.item.name
            .toLowerCase()
            .compareTo(a.item.name.toString().toLowerCase());
      });
    } else if (sortType.state == SortType.category) {
      result.sort((a, b) {
        return a.compareTo(b);
      });
    }
    return result;
  } else {
    return [];
  }
});

final shopItemSortType = StateProvider((ref) => SortType.alpha);

class FilterController {
  List<StateController> filters;
  StateController currentCategory;
  FilterController(this.filters, this.currentCategory);
  void clear() {
    filters.forEach((element) {
      element.state = '';
    });
    currentCategory.state = Category('');
  }
}

final filtersNotifierProvider = Provider<FilterController>((ref) {
  final _entryFilter = ref.watch(entryFilter);
  final _categoryFilter = ref.watch(categoryFilter);
  final _shopItemFilter = ref.watch(shopItemFilter);
  final _currentCategory = ref.watch(currentCategory);
  return FilterController(
      [_entryFilter, _categoryFilter, _shopItemFilter], _currentCategory);
});

final filteredShopItems = Provider<List<ShopItem>>((ref) {
  final filter = ref.watch(shopItemFilter);
  final category = ref.watch(currentCategory);
  final items = ref.watch(shopItemRepositoryProvider).data;
  final sortType = ref.watch(shopItemSortType);

  if (items != null && items.length > 0) {
    final result = items
        .where((item) =>
            item.name.toLowerCase().contains(filter.state.toLowerCase()))
        .where((item) {
      return (item.category == null && category.state == null) ||
          category.state == null ||
          category.state.name == '' ||
          item.category == null ||
          item.category == category.state;
    }).toList();
    if (sortType.state == SortType.alpha) {
      result.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toString().toLowerCase());
      });
    } else if (sortType.state == SortType.inversedAlpha) {
      result.sort((a, b) {
        return b.name.toLowerCase().compareTo(a.name.toString().toLowerCase());
      });
    } else if (sortType.state == SortType.category) {
      result.sort((a, b) {
        return a.compareTo(b);
      });
    }
    return result;
  } else {
    return [];
  }
});
