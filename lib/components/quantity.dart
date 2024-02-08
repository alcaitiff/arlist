import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:flutter/services.dart';

class Quantity {
  static show(BuildContext context, String value, Function continueCallback,
      void Function()? cancelCallback) {
    final TextEditingController _textFieldController =
        TextEditingController(text: value);
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(S.of(context).cancel),
      onPressed: cancelCallback,
    );
    Widget continueButton = TextButton(
      child: Text(S.of(context).continue_it),
      onPressed: () => continueCallback(_textFieldController.text),
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).quantity),
      content: TextField(
        autofocus: true,
        controller: _textFieldController,
        onEditingComplete: () => continueCallback(_textFieldController.text),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
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
