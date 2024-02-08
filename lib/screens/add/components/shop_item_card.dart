import 'package:ar_list/business/ShopItem/event.dart' as ShopItemEvent;
import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/components/category_modal.dart';
import 'package:ar_list/components/confirmation.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopItemCard extends HookConsumerWidget {
  final ShopItem item;
  final StateProvider<ShopList> listProvider;

  ShopItemCard(this.item, this.listProvider);

  void delete(
      ShopItem item,
      ShopList list,
      StateController<ShopList> listController,
      BuildContext context,
      WidgetRef ref) {
    final shopItem = ref.read(shopItemNotifierProvider.notifier);
    final shopList = ref.read(shopListNotifierProvider.notifier);
    final filter = ref.read(shopItemFilter.notifier);
    final ns = Navigator.of(context);
    Confirmation.show(context, S.of(context).remove_item_confirmation, () {
      list.removeShopItem(item);
      shopItem.event(ShopItemEvent.RemoveEvent(item));
      shopList.event(WriteEvent());
      filter.state += '';
      listController.state = list;
      ns.pop();
    }, () {
      ns.pop();
    });
  }

  void toogle(
      WidgetRef ref, ShopList list, StateController<ShopList> provider) {
    list.contains(item) ? list.removeShopItem(item) : list.addShopItem(item);
    ref.read(shopListNotifierProvider.notifier).event(WriteEvent());
    provider.state = list;
    ref.read(shopItemFilter.notifier).state += '';
  }

  Widget build(BuildContext context, WidgetRef ref) {
    StateController<ShopList> provider = ref.read(listProvider.notifier);
    final ShopList list = provider.state;
    StateController<String> filter = ref.read(shopItemFilter.notifier);
    // final
    return Material(
        elevation: 5,
        child: ListTile(
          trailing: GestureDetector(
            child:
                Icon(Icons.delete_forever, color: Theme.of(context).hintColor),
            onTap: () => delete(item, list, provider, context, ref),
          ),
          title: Row(children: [
            GestureDetector(
                child: list.contains(item)
                    ? Icon(Icons.remove, color: Theme.of(context).hintColor)
                    : Icon(Icons.add, color: Theme.of(context).disabledColor),
                onTap: () => toogle(ref, list, provider)),
            GestureDetector(
              onTap: () => toogle(ref, list, provider),
              child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    item.name.trim(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: list.contains(item)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor),
                    //style: _biggerFont,
                  )),
            ),
            Expanded(child: Text("")),
            TextButton(
                child: Text(
                    (item.category!.name == '') ? ' - ' : item.category!.name,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Theme.of(context).disabledColor,
                        fontSize: 11,
                        fontStyle: FontStyle.italic)),
                onPressed: () {
                  CategoryModal.show(context, item.category, (value) {
                    item.category = value;
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
        ));
  }
}
