import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:ar_list/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Body extends ConsumerStatefulWidget {
  final ShopList _list;
  Body(this._list);
  @override
  ConsumerState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends ConsumerState<Body> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _BodyWidgetState();

  void submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(shopListNotifierProvider.notifier).event(AddEvent(widget._list));
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: routes['/']!));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    initialValue: widget._list.name,
                    decoration: InputDecoration(
                      hintText: S.of(context).list_name_hint,
                      labelText: S.of(context).list_name,
                    ),
                    onChanged: (String newValue) {
                      widget._list.name = newValue.trim();
                    },
                    onEditingComplete: () {
                      submit();
                    },
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return S.of(context).error_empty_value;
                      }
                      return null;
                    },
                  ),
                  new Container(
                      child: new ElevatedButton(
                    child: Text(S.of(context).save),
                    onPressed: () {
                      submit();
                    },
                  )),
                ],
              )));
    });
  }
}
