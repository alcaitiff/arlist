import 'package:ar_list/business/ShopItem/event.dart';
import 'package:ar_list/business/ShopList/event.dart' as ListEvent;
import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:ar_list/screens/add/components/shop_item_card.dart';
import 'package:ar_list/screens/add/components/tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Body extends HookConsumerWidget {
  final GlobalKey<FormState> formKey;
  final StateProvider<ShopList> listProvider;

  Body(this.formKey, this.listProvider);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(filteredShopItems);
    StateController<ShopList> lp = ref.watch(listProvider.notifier);
    final inList = items.where((element) => lp.state.contains(element));
    final outList = items.where((element) => !lp.state.contains(element));
    final textController = useTextEditingController();
    StateController<String> filter = ref.watch(shopItemFilter.notifier);
    final cf = ref.watch(categoryFilter);
    return Consumer(builder: (context, watch, child) {
      return new Form(
          key: formKey,
          child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                new TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: S.of(context).item_name_hint,
                    labelText: S.of(context).item_name,
                  ),
                  onChanged: (String newValue) {
                    filter.state = newValue.trim();
                  },
                  onEditingComplete: () {
                    if (formKey.currentState!.validate()) {
                      ShopItem item =
                          ShopItem(filter.state, ref.read(currentCategory));
                      ref
                          .read(shopItemNotifierProvider.notifier)
                          .event(AddEvent(item));
                      lp.state.addShopItem(item);
                      ref
                          .read(shopListNotifierProvider.notifier)
                          .event(ListEvent.WriteEvent());
                      filter.state = '';
                      textController.clear();
                      FocusScope.of(context).unfocus();
                    }
                  },
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return S.of(context).error_empty_value;
                    }
                    return null;
                  },
                ),
                const Toolbar(),
                const SizedBox(height: 5),
                for (var i = 0; i < inList.length; i++) ...[
                  if (i > 0) const Divider(height: 0),
                  Dismissible(
                    key: UniqueKey(),
                    onDismissed: (_) {},
                    background: new Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20.0),
                      color: Theme.of(context).disabledColor,
                      child: Icon(Icons.visibility_off,
                          color: Theme.of(context).hintColor),
                    ),
                    secondaryBackground: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20.0),
                      color: Theme.of(context).disabledColor,
                      child: Icon(Icons.visibility_off,
                          color: Theme.of(context).hintColor),
                    ),
                    child: ShopItemCard(inList.elementAt(i), listProvider),
                  ),
                ],
                for (var i = 0; i < outList.length; i++) ...[
                  if (i > 0) const Divider(height: 0),
                  Dismissible(
                    key: UniqueKey(),
                    onDismissed: (_) {},
                    background: new Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20.0),
                      color: Theme.of(context).disabledColor,
                      child: Icon(Icons.visibility_off,
                          color: Theme.of(context).hintColor),
                    ),
                    secondaryBackground: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20.0),
                      color: Theme.of(context).disabledColor,
                      child: Icon(Icons.visibility_off,
                          color: Theme.of(context).hintColor),
                    ),
                    child: ShopItemCard(outList.elementAt(i), listProvider),
                  ),
                ],
              ]));
    });
  }
}
