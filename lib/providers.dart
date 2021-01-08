import 'package:ar_list/business/ShopList/notifier.dart';
import 'package:ar_list/repositories/shop_list_repository.dart';
import 'package:hooks_riverpod/all.dart';

final shopListRepositoryProvider = Provider<ShopListRepository>(
  (ref) => ShopListRepository.instance,
);

final shopListNotifierProvider = StateNotifierProvider(
  (ref) => ShopListNotifier(ref.watch(shopListRepositoryProvider)),
);
