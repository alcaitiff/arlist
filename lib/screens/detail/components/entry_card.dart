import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/components/category_modal.dart';
import 'package:ar_list/components/quantity.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/models/shop_list_entry.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EntryCard extends HookConsumerWidget {
  final ShopListEntry item;
  StateProvider<ShopList> listProvider;

  EntryCard(this.item, this.listProvider);

  void toggleItem(
      ShopListEntry item,
      BuildContext context,
      StateController<ShopList> provider,
      ShopList list,
      StateController<String> filter,
      WidgetRef ref) {
    item.got = !item.got;
    ref.read(shopListNotifierProvider.notifier).event(WriteEvent());
    provider.state = list;
    //SETCONTEXT
    filter.state += '';
  }

  Widget build(BuildContext context, WidgetRef ref) {
    StateController<ShopList> provider = ref.read(listProvider.notifier);
    StateController<String> filter = ref.read(entryFilter.notifier);
    ShopList list = provider.state;
    // final
    return Material(
        elevation: 5,
        child: ListTile(
          trailing: GestureDetector(
            child: Text("x ${item.quantity}",
                style: TextStyle(color: Theme.of(context).disabledColor)),
            onTap: () {
              Quantity.show(context, '', (n) {
                item.quantity = int.parse(n);
                //SETCONTEXT
                filter.state += '';
                ref.read(shopListNotifierProvider.notifier).event(WriteEvent());
                Navigator.of(context).pop();
              }, () {
                Navigator.of(context).pop();
              });
            },
          ),
          title: Row(children: [
            item.got
                ? Icon(Icons.check_box, color: Theme.of(context).disabledColor)
                : Icon(Icons.crop_square,
                    color: Theme.of(context).primaryColor),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  item.item!.name,
                  style: TextStyle(
                      color: item.got
                          ? Theme.of(context).disabledColor
                          : Theme.of(context).primaryColor),
                  //style: _biggerFont,
                )),
            Expanded(child: Text("")),
            TextButton(
                child: Text(
                    (item.item?.category?.name == '')
                        ? ' - '
                        : item.item!.category!.name,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Theme.of(context).disabledColor,
                        fontSize: 11,
                        fontStyle: FontStyle.italic)),
                onPressed: () {
                  CategoryModal.show(context, item.item!.category, (value) {
                    item.item!.category = value;
                    //SETCONTEXT
                    filter.state += '';
                    ref
                        .read(shopListNotifierProvider.notifier)
                        .event(WriteEvent());
                    Navigator.of(context).pop();
                  }, () {
                    Navigator.of(context).pop();
                  });
                })
          ]),
          onTap: () => toggleItem(item, context, provider, list, filter, ref),
        ));
  }
}
