import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:ar_list/generated/l10n.dart';

class CategoryDropdown extends StatefulWidget {
  final Function callbackAction;
  final Category initialValue;
  final Key key;
  CategoryDropdown(this.key, this.initialValue, this.callbackAction);

  @override
  _CategoryDropdownState createState() =>
      _CategoryDropdownState(this.initialValue);
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  Category currentValue;

  _CategoryDropdownState(this.currentValue);

  Widget build(BuildContext context) {
    List<Category> list =
        context.read(categoryRepositoryProvider).data.toList();
    list.sort();
    if (!list.contains(currentValue)) {
      list.add(currentValue);
    }
    return DropdownButton<Category>(
      key: widget.key,
      value: currentValue,
      hint: Text(S.of(context).category),
      style: TextStyle(color: Theme.of(context).primaryColor),
      underline: Container(
        height: 0,
      ),
      onChanged: (Category newValue) {
        setState(() {
          currentValue = newValue;
          widget.callbackAction(newValue);
        });
      },
      items: list.map((e) {
        e = (e == null) ? Category('') : e;
        return DropdownMenuItem<Category>(
          value: e,
          child: Text(e.name),
        );
      }).toList(),
    );
  }
}
