import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShopItemCard extends HookWidget {
  ShopItem item;
  final ShopList list;

  ShopItemCard(this.item, this.list);
  Widget build(BuildContext context) {
    // final
    return Material(
        elevation: 5,
        child: ListTile(
          trailing: Icon(Icons.delete_forever),
          leading: list.contains(item) ? Icon(Icons.remove) : Icon(Icons.add),
          title: Text(
            item.name,
            //style: _biggerFont,
          ),
          onTap: () {
            list.contains(item)
                ? list.removeShopItem(item)
                : list.addShopItem(item);
          },
        ));
  }
}
