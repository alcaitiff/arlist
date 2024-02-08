import 'package:ar_list/business/Category/event.dart' as CategoryEvent;
import 'package:ar_list/business/ShopItem/event.dart' as ShopItemEvent;
import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/business/ShopList/state.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:ar_list/screens/home/components/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Body extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, watch, child) {
        final state = ref.watch(shopListNotifierProvider);
        if (state is ShopListUnloadedState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(shopListNotifierProvider.notifier).event(ReadEvent());
            ref
                .read(shopItemNotifierProvider.notifier)
                .event(ShopItemEvent.ReadEvent());
            ref
                .read(categoryNotifierProvider.notifier)
                .event(CategoryEvent.ReadEvent());
          });
          return Center(child: Text(S.of(context).loading));
        } else if (state is ShopListEmptyState) {
          return Center(
            child: Text(S.of(context).no_lists),
          );
        } else if (state is ShopListFetchingState) {
          return Center(child: Text(S.of(context).loading));
        } else if (state is ShopListFetchedState) {
          return _buildLists(context, state.list);
        } else if (state is ShopListErrorState) {
          return Center(child: Text(S.of(context).error));
        } else {
          return Center(child: Text(S.of(context).error));
        }
      },
    );
  }

  Widget _buildLists(context, Set<ShopList> lists) {
    if (lists.isEmpty) {
      return Center(
        child: Text(S.of(context).no_lists),
      );
    } else {
      return Center(
        child: Lists(lists),
      );
    }
  }
}
