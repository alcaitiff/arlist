import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/components/category_modal.dart';
import 'package:ar_list/components/confirmation.dart';
import 'package:ar_list/components/quantity.dart';
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
          trailing: TextButton(
            child: Text("x ${item.quantity}",
                style: TextStyle(color: Theme.of(context).disabledColor)),
            onPressed: () {
              Quantity.show(context, '', (n) {
                print(n);
                item.quantity = int.parse(n);
                filter.state += '';
                context.read(shopListNotifierProvider).event(WriteEvent());
                Navigator.of(context).pop();
              }, () {
                Navigator.of(context).pop();
              });
            },
          ),
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
          title: Row(children: [
            Text(
              item.item.name,
              style: TextStyle(
                  color: item.got
                      ? Theme.of(context).disabledColor
                      : Theme.of(context).primaryColor),
              //style: _biggerFont,
            ),
            Expanded(child: Text("")),
            TextButton(
                child: Text(
                    (item.item.category.name == '')
                        ? ' - '
                        : item.item.category.name,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Theme.of(context).disabledColor,
                        fontSize: 11,
                        fontStyle: FontStyle.italic)),
                onPressed: () {
                  CategoryModal.show(context, item.item.category, (value) {
                    item.item.category = value;
                    filter.state += '';
                    context.read(shopListNotifierProvider).event(WriteEvent());
                    Navigator.of(context).pop();
                  }, () {
                    Navigator.of(context).pop();
                  });
                })
          ]),
          onTap: () => toggleItem(item, context, provider, list, filter),
        ));
  }
}
