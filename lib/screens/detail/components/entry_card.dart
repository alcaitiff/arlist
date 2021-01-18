import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/components/confirmation.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/models/shop_list_entry.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:ar_list/generated/l10n.dart';

class EntryCard extends HookWidget {
  final ShopListEntry item;
  final StateProvider<ShopList> listProvider;

  EntryCard(this.item, this.listProvider);

  void toggleItem(ShopListEntry item, BuildContext context,
      StateController provider, ShopList list, StateController filter) {
    item.got = !item.got;
    context.read(shopListNotifierProvider).event(WriteEvent());
    provider.state = list;
    filter.state += '';
  }

  Widget build(BuildContext context) {
    final provider = useProvider(listProvider);
    final filter = useProvider(entryFilter);
    final ShopList list = provider.state;
    // final
    return Material(
        elevation: 5,
        child: ListTile(
          // trailing: IconButton(
          //     icon: Icon(Icons.delete),
          //     onPressed: () => delete(item, list, provider, context),
          //     color: Theme.of(context).disabledColor),
          leading: item.got
              ? IconButton(
                  icon: Icon(Icons.check_box),
                  onPressed: () =>
                      toggleItem(item, context, provider, list, filter),
                  color: Theme.of(context).disabledColor)
              : IconButton(
                  icon: Icon(Icons.crop_square),
                  onPressed: () =>
                      toggleItem(item, context, provider, list, filter),
                  color: Theme.of(context).primaryColor),
          title: Text(
            item.item.name,
            style: TextStyle(
                color: item.got
                    ? Theme.of(context).disabledColor
                    : Theme.of(context).primaryColor),
            //style: _biggerFont,
          ),
          onTap: () => toggleItem(item, context, provider, list, filter),
        ));
  }
}
