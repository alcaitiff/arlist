import 'package:ar_list/business/Category/event.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers.dart';
import 'package:ar_list/screens/category/components/category_card.dart';
import 'package:ar_list/screens/category/components/tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Body extends HookConsumerWidget {
  final GlobalKey<FormState> formKey;

  Body(this.formKey);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Category> list = ref.watch(filteredCategories);
    final textController = useTextEditingController();
    StateController<String> filter = ref.read(categoryFilter.notifier);
    SortType sortType = ref.watch(categorySortType);
    return Consumer(builder: (context, watch, child) {
      return new Form(
          key: formKey,
          child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                new TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: S.of(context).category_name_hint,
                    labelText: S.of(context).category_name,
                  ),
                  onChanged: (String newValue) {
                    filter.state = newValue.trim();
                  },
                  onEditingComplete: () {
                    if (formKey.currentState!.validate()) {
                      Category item = Category(filter.state.trim());
                      ref
                          .read(categoryNotifierProvider.notifier)
                          .event(AddEvent(item));
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
                for (var i = 0; i < list.length; i++) ...[
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
                    child: CategoryCard(list.elementAt(i)),
                  ),
                ],
              ]));
    });
  }
}
