import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers/shop_list_provider.dart';
import 'package:ar_list/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final ShopList _list;
  final ShopListProvider provider = ShopListProvider.instance;

  Body(this._formKey, this._list);

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
                  initialValue: _list.name,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).list_name_hint,
                    labelText: AppLocalizations.of(context).list_name,
                  ),
                  onChanged: (String newValue) {
                    _list.name = newValue;
                  },
                ),
                new Container(
                    child: new RaisedButton(
                  child: Text(AppLocalizations.of(context).save),
                  onPressed: () {
                    provider.add(_list);
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: routes['/']));
                  },
                )),
              ],
            )));
  }
}
