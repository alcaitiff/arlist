import 'package:ar_list/business/Category/event.dart';
import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:ar_list/generated/l10n.dart';

class CategorySelector extends HookWidget {
  Widget build(BuildContext context) {
    final TextEditingController _typeAheadController = TextEditingController();
    List<Category> list = useProvider(categoryRepositoryProvider).data.toList();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Category category = useProvider(currentCategory).state;
    StateController filter = useProvider(categoryFilter);
    _typeAheadController.text = filter.state;
    final _focusNode = FocusNode();

    _focusNode.addListener(() {
      Category c = context.read(currentCategory).state;
      if (!_focusNode.hasFocus &&
          c != null &&
          _typeAheadController.text.trim() != c.name.trim()) {
        context.read(currentCategory).state = Category('');
        _typeAheadController.text = '';
        filter.state = '';
      }
    });

    return Form(
      key: _formKey,
      child: Container(
          width: 260,
          child: ListTile(
            trailing: (filter.state.trim() != '' &&
                    (category == null ||
                        filter.state.trim() != category.name.trim()))
                ? IconButton(
                    icon: Icon(Icons.add),
                    padding: EdgeInsets.only(right: 16.0),
                    onPressed: () {
                      Category c = Category(_typeAheadController.text.trim());
                      context.read(categoryNotifierProvider).event(AddEvent(c));
                      context.read(currentCategory).state = c;
                      _typeAheadController.text =
                          _typeAheadController.text.trim();
                      filter.state = filter.state.trim() + '';
                    })
                : (filter.state.trim() != '')
                    ? IconButton(
                        icon: Icon(Icons.delete_forever),
                        padding: EdgeInsets.only(right: 16.0),
                        onPressed: () {
                          context.read(categoryNotifierProvider).event(
                              RemoveEvent(context.read(currentCategory).state));
                          filter.state = '';
                        })
                    : null,
            title: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: _typeAheadController,
                  autofocus: false,
                  focusNode: _focusNode,
                  onEditingComplete: () {
                    Category c = Category(_typeAheadController.text.trim());
                    context.read(categoryNotifierProvider).event(AddEvent(c));
                    context.read(currentCategory).state = c;
                    _typeAheadController.text =
                        _typeAheadController.text.trim();
                    filter.state = _typeAheadController.text;
                  },
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontStyle: FontStyle.italic),
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: S.of(context).category)),
              noItemsFoundBuilder: (BuildContext context) => null,
              suggestionsCallback: (pattern) {
                return list.where((element) => element.name
                    .toLowerCase()
                    .startsWith(pattern.toLowerCase()));
              },
              onSaved: (value) => print(value),
              itemBuilder: (context, Category suggestion) {
                return ListTile(
                    contentPadding: EdgeInsets.only(left: 10),
                    title: Text(suggestion.name));
              },
              suggestionsBoxDecoration:
                  SuggestionsBoxDecoration(hasScrollbar: true),
              onSuggestionSelected: (Category suggestion) {
                if (suggestion != null) {
                  context.read(currentCategory).state = suggestion;
                  _typeAheadController.text = suggestion.name;
                  filter.state = _typeAheadController.text;
                }
              },
            ),
          )),
    );
  }
}
