import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/repositories/shop_list_repository.dart';
import 'package:ar_list/routes.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final ShopList _list;
  final ShopListRepository repository = ShopListRepository.instance;

  Body(this._formKey, this._list);

  void submit(context) {
    if (_formKey.currentState.validate()) {
      repository.add(_list);
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: routes['/']));
    }
  }

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
                  autofocus: true,
                  initialValue: _list.name,
                  decoration: InputDecoration(
                    hintText: S.of(context).list_name_hint,
                    labelText: S.of(context).list_name,
                  ),
                  onChanged: (String newValue) {
                    _list.name = newValue.trim();
                  },
                  onEditingComplete: () {
                    submit(context);
                  },
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return S.of(context).error_empty_value;
                    }
                    return null;
                  },
                ),
                new Container(
                    child: new ElevatedButton(
                  child: Text(S.of(context).save),
                  onPressed: () {
                    submit(context);
                  },
                )),
              ],
            )));
  }
}
