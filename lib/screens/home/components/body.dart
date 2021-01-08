import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/business/ShopList/state.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:ar_list/screens/home/components/lists.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(shopListNotifierProvider.state);
        if (state is ShopListUnloadedState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read(shopListNotifierProvider).event(ReadEvent());
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
