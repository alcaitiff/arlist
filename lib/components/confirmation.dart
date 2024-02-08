import 'package:ar_list/generated/l10n.dart';
import 'package:flutter/material.dart';

class Confirmation {
  static show(BuildContext context, String msg,
      void Function()? continueCallback, void Function()? cancelCallback) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(S.of(context).cancel),
      onPressed: cancelCallback,
    );
    Widget continueButton = TextButton(
      child: Text(S.of(context).continue_it),
      onPressed: continueCallback,
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).confirmation),
      content: Text(msg),
      actions: [
        cancelButton,
        continueButton,
      ],
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
