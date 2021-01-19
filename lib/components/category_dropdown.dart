import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:ar_list/generated/l10n.dart';

class CategoryDropdown extends StatefulWidget {
  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  Category currentValue;
  Widget build(BuildContext context) {
    List<Category> list =
        context.read(categoryRepositoryProvider).data.toList();
    list.sort();
    StateController<Category> category = context.read(currentCategory);
    return DropdownButton<Category>(
      value: currentValue,
      hint: Text(S.of(context).category),
      style: TextStyle(color: Theme.of(context).primaryColor),
      underline: Container(
        height: 0,
      ),
      onChanged: (Category newValue) {
        setState(() {
          currentValue = newValue;
          category.state = newValue;
        });
      },
      items: list.map((e) {
        return DropdownMenuItem<Category>(
          value: e,
          child: Text(e.name),
        );
      }).toList(),
    );
  }
}
