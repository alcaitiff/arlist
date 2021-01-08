import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:hooks_riverpod/all.dart';

class Body extends StatefulWidget {
  final ShopList _list;
  final GlobalKey<FormState> _formKey;

  Body(this._formKey, this._list);

  @override
  _BodyWidgetState createState() => _BodyWidgetState(_formKey, _list);
}

class _BodyWidgetState extends State<Body> {
  final ShopList _list;
  final GlobalKey<FormState> _formKey;

  _BodyWidgetState(this._formKey, this._list);

  void submit(tmpName) {
    if (_formKey.currentState.validate()) {
      _list.name = tmpName.trim();
      context.read(shopListNotifierProvider).event(WriteEvent());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    String tmpName = _list.name;
    return Consumer(builder: (context, watch, child) {
      return SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    autofocus: true,
                    initialValue: _list.name,
                    decoration: InputDecoration(
                      hintText: S.of(context).list_name_hint,
                      labelText: S.of(context).list_name,
                    ),
                    onChanged: (String newValue) {
                      tmpName = newValue.trim();
                    },
                    onEditingComplete: () {
                      submit(tmpName);
                    },
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return S.of(context).error_empty_value;
                      }
                      return null;
                    },
                  ),
                  new Container(
                      child: new RaisedButton(
                    child: Text(S.of(context).save),
                    onPressed: () {
                      submit(tmpName);
                    },
                  )),
                ],
              )));
    });
  }
}
