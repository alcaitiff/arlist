import 'package:ar_list/components/category_dropdown.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/models/category.dart';
import 'package:flutter/material.dart';

class CategoryModal {
  static show(
    BuildContext context,
    Category? value,
    Function continueCallback,
    Function()? cancelCallback,
  ) {
    Key key = Key(value.hashCode.toString());
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(S.of(context).cancel),
      onPressed: cancelCallback,
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).select_category),
      content: CategoryDropdown(key, value, (value) {
        continueCallback(value);
      }),
      actions: [cancelButton],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
