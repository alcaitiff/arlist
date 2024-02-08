import 'package:ar_list/business/Category/event.dart';
import 'package:ar_list/components/confirmation.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryCard extends HookConsumerWidget {
  final Category item;
  CategoryCard(this.item);

  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        elevation: 5,
        child: ListTile(
          trailing: GestureDetector(
            child:
                Icon(Icons.delete_forever, color: Theme.of(context).hintColor),
            onTap: () async {
              final cnp = ref.read(categoryNotifierProvider.notifier);
              final cf = ref.read(categoryFilter.notifier);
              NavigatorState ns = Navigator.of(context);
              Confirmation.show(context, S.of(context).remove_item_confirmation,
                  () {
                cnp.event(RemoveEvent(item));
                cf.state += '';
                ns.pop();
              }, () {
                ns.pop();
              });
            },
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
