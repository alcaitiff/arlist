import 'package:ar_list/business/Category/event.dart';
import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ar_list/generated/l10n.dart';

class CategorySelector extends HookConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _typeAheadController = TextEditingController();
    List<Category> list = ref.watch(categoryRepositoryProvider).data.toList();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Category category = ref.watch(currentCategory);
    StateController filter = ref.read(categoryFilter.notifier);
    _typeAheadController.text = filter.state;
    final _focusNode = FocusNode();

    _focusNode.addListener(() {
      StateController<Category> c = ref.read(currentCategory.notifier);
      if (!_focusNode.hasFocus &&
          _typeAheadController.text.trim() != c.state.name.trim()) {
        c.state = Category('');
        _typeAheadController.text = '';
        filter.state = '';
      }
    });

    Future<List<Category>> suggestionsCallback(String pattern) async =>
        Future<List<Category>>.delayed(
          Duration(milliseconds: 100),
          () => list
              .where((element) =>
                  element.name.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList(),
        );

    return Form(
      key: _formKey,
      child: Container(
          width: 260,
          child: ListTile(
            trailing: (filter.state.trim() != '' &&
                    (filter.state.trim() != category.name.trim()))
                ? IconButton(
                    icon: Icon(Icons.add),
                    padding: EdgeInsets.only(right: 16.0),
                    onPressed: () {
                      Category c = Category(_typeAheadController.text.trim());
                      ref
                          .read(categoryNotifierProvider.notifier)
                          .event(AddEvent(c));
                      //SETCONTEXT
                      ref.read(currentCategory.notifier).state = c;
                      _typeAheadController.text =
                          _typeAheadController.text.trim();
                      filter.state = filter.state.trim() + '';
                    })
                : (filter.state.trim() != '')
                    ? IconButton(
                        icon: Icon(Icons.delete_forever),
                        padding: EdgeInsets.only(right: 16.0),
                        onPressed: () {
                          ref
                              .read(categoryNotifierProvider.notifier)
                              .event(RemoveEvent(ref.read(currentCategory)));
                          filter.state = '';
                        })
                    : null,
            title: CupertinoTypeAheadField(
              builder: (context, controlles, focusNode) => CupertinoTextField(
                controller: _typeAheadController,
                autofocus: false,
                focusNode: _focusNode,
                onEditingComplete: () {
                  Category c = Category(_typeAheadController.text.trim());
                  ref
                      .read(categoryNotifierProvider.notifier)
                      .event(AddEvent(c));
                  //SETCONTEXT
                  ref.read(currentCategory.notifier).state = c;
                  _typeAheadController.text = _typeAheadController.text.trim();
                  filter.state = _typeAheadController.text;
                },
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              suggestionsCallback: suggestionsCallback,
              itemBuilder: (context, Category suggestion) {
                return ListTile(
                    contentPadding: EdgeInsets.only(left: 10),
                    title: Text(suggestion.name));
              },
              onSelected: (Category suggestion) {
                ref.read(currentCategory.notifier).state = suggestion;
                _typeAheadController.text = suggestion.name;
                filter.state = _typeAheadController.text;
              },
            ),
          )),
    );
  }
}
