import 'package:ar_list/business/ShopItem/event.dart';
import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:ar_list/screens/add/components/shop_item_card.dart';
import 'package:ar_list/screens/add/components/tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class Body extends HookWidget {
  final GlobalKey<FormState> formKey;
  final StateProvider<ShopList> listProvider;

  Body(this.formKey, this.listProvider);
// TODO: refresh da lista ao remover, ver o dismiss com texto embaixo
  @override
  Widget build(BuildContext context) {
    final items = useProvider(filteredShopItems);
    final lp = useProvider(listProvider);
    final inList = items.where((element) => lp.state.contains(element));
    final outList = items.where((element) => !lp.state.contains(element));
    final newTodoController = useTextEditingController();
    final filter = useProvider(shopItemFilter);
    return Consumer(builder: (context, watch, child) {
      return new Form(
          key: formKey,
          child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                new TextFormField(
                  controller: newTodoController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: S.of(context).item_name_hint,
                    labelText: S.of(context).item_name,
                  ),
                  onChanged: (String newValue) {
                    filter.state = newValue.trim();
                  },
                  onEditingComplete: () {
                    if (formKey.currentState.validate()) {
                      context
                          .read(shopItemNotifierProvider)
                          .event(AddEvent(ShopItem(filter.state, null)));
                      filter.state = '';
                      newTodoController.clear();
                    }
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return S.of(context).error_empty_value;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Toolbar(),
                for (var i = 0; i < inList.length; i++) ...[
                  if (i > 0) const Divider(height: 0),
                  Dismissible(
                    key: ValueKey(inList.elementAt(i).hashCode),
                    onDismissed: (_) {
                      context
                          .read(shopItemNotifierProvider)
                          .event(RemoveAtEvent(i));
                    },
                    child: ShopItemCard(inList.elementAt(i), listProvider),
                  ),
                ],
                for (var i = 0; i < outList.length; i++) ...[
                  if (i > 0) const Divider(height: 0),
                  Dismissible(
                    key: ValueKey(outList.elementAt(i).hashCode),
                    onDismissed: (_) {
                      context
                          .read(shopItemNotifierProvider)
                          .event(RemoveAtEvent(i));
                    },
                    child: ShopItemCard(outList.elementAt(i), listProvider),
                  ),
                ],
              ]));
    });
  }
}
