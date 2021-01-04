import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> _formKey;

  Body(this._formKey);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: new Form(
            key: _formKey,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                new TextFormField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).list_name_hint,
                    labelText: AppLocalizations.of(context).list_name,
                  ),
                ),
                new Container(
                    child: new RaisedButton(
                  child: const Text('Submit'),
                  onPressed: null,
                )),
              ],
            )));
  }
}
