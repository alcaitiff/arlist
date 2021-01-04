import 'package:flutter/material.dart';

class Confirmation {
  show(BuildContext context, Function continueCallback,
      Function cancelCallback) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: cancelCallback,
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: continueCallback,
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
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
