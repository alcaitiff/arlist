import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/models/shop_list_entry.dart';
import 'package:ar_list/providers.dart';
import 'package:ar_list/screens/detail/components/entry_card.dart';
import 'package:ar_list/screens/detail/components/tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Body extends HookConsumerWidget {
  final GlobalKey<FormState> formKey;
  final ShopList list;

  Body(this.formKey, this.list);

  void remove(
      WidgetRef ref, ShopListEntry? entry, StateController<String> filter) {
    list.removeItem(entry!);
    ref.read(shopListNotifierProvider.notifier).event(WriteEvent());
    //SETCONTEXT
    filter.state += '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ShopListEntry?> entries = ref.watch(filteredEntries);
    StateProvider<ShopList> listProvider =
        StateProvider<ShopList>((ref) => list);
    Iterable<ShopListEntry?> inList = entries.where((element) => element!.got);
    Iterable<ShopListEntry?> outList =
        entries.where((element) => !element!.got);
    final textController = useTextEditingController();
    StateController<String> filter = ref.read(entryFilter.notifier);
    return SafeArea(
        top: false,
        bottom: false,
        child: new Form(
            key: formKey,
            child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    autofocus: false,
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: S.of(context).filter_hint,
                      labelText: S.of(context).filter,
                    ),
                    onChanged: (String newValue) {
                      //SETCONTEXT
                      filter.state = newValue.trim();
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  const SizedBox(height: 20),
                  const Toolbar(),
                  for (var i = 0; i < outList.length; i++) ...[
                    if (i > 0) const Divider(height: 0),
                    Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          remove(ref, outList!.elementAt(i), filter);
                        }
                      },
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
                        color: Theme.of(context).colorScheme.error,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: EntryCard(outList.elementAt(i)!, listProvider),
                    ),
                  ],
                  for (var i = 0; i < inList.length; i++) ...[
                    if (i > 0) const Divider(height: 0),
                    Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          remove(ref, inList.elementAt(i), filter);
                        }
                      },
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
                        color: Theme.of(context).colorScheme.error,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: EntryCard(inList.elementAt(i)!, listProvider),
                    ),
                  ],
                ])));
  }
}
