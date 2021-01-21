import 'package:ar_list/business/Category/event.dart';
import 'package:ar_list/components/confirmation.dart';
import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:ar_list/generated/l10n.dart';

class CategoryCard extends HookWidget {
  final Category item;

  CategoryCard(this.item);

  void delete(Category item, BuildContext context) {
    Confirmation.show(context, S.of(context).remove_item_confirmation, () {
      context.read(categoryNotifierProvider).event(RemoveEvent(item));
      //To refresh
      context.read(categoryFilter).state += '';
      Navigator.of(context).pop();
    }, () {
      Navigator.of(context).pop();
    });
  }

  Widget build(BuildContext context) {
    return Material(
        elevation: 5,
        child: ListTile(
          trailing: GestureDetector(
            child:
                Icon(Icons.delete_forever, color: Theme.of(context).hintColor),
            onTap: () => delete(item, context),
          ),
          title: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                item.name.trim(),
                textAlign: TextAlign.left,
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),
        ));
  }
}
