import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/business/ShopItem/event.dart' as ShopItemEvent;
import 'package:ar_list/components/confirmation.dart';
import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:ar_list/generated/l10n.dart';

class ShopItemCard extends HookWidget {
  final ShopItem item;
  final StateProvider<ShopList> listProvider;

  ShopItemCard(this.item, this.listProvider);

  void delete(ShopItem item, ShopList list, StateController listController,
      BuildContext context) {
    Confirmation.show(context, S.of(context).remove_item_confirmation, () {
      list.removeShopItem(item);
      context
          .read(shopItemNotifierProvider)
          .event(ShopItemEvent.RemoveEvent(item));
      context.read(shopListNotifierProvider).event(WriteEvent());
      //To refresh
      context.read(shopItemFilter).state += '';
      listController.state = list;
      Navigator.of(context).pop();
    }, () {
      Navigator.of(context).pop();
    });
  }

  Widget build(BuildContext context) {
    final provider = useProvider(listProvider);
    final ShopList list = provider.state;
    // final
    return Material(
        elevation: 5,
        child: ListTile(
          trailing: IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () => delete(item, list, provider, context),
              color: Theme.of(context).hintColor),
          leading: list.contains(item)
              ? Icon(Icons.remove, color: Theme.of(context).hintColor)
              : Icon(Icons.add, color: Theme.of(context).disabledColor),
          title: Text(
            item.name,
            style: TextStyle(
                color: list.contains(item)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor),
            //style: _biggerFont,
          ),
          onTap: () {
            list.contains(item)
                ? list.removeShopItem(item)
                : list.addShopItem(item);
            context.read(shopListNotifierProvider).event(WriteEvent());
            provider.state = list;
          },
        ));
  }
}
