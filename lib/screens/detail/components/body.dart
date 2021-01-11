import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:ar_list/repositories/shop_list_repository.dart';
import 'package:ar_list/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class Body extends HookWidget {
  final GlobalKey<FormState> formKey;
  final ShopList list;

  Body(this.formKey, this.list);

  void submit(context) {
    if (formKey.currentState.validate()) {
      context.read(shopListNotifierProvider).event(WriteEvent());
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
            key: formKey,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: list.items.length,
                itemBuilder: /*1*/ (context, i) {
                  return Card(
                      child: ListTile(
                    //trailing: showPopup(i),
                    title: Text(
                      list.items.elementAt(i).item.name,
                      //style: _biggerFont,
                    ),
                    onTap: () {
                      //Navigator.pushNamed(context, '/detail', arguments: lists.elementAt(i));
                    },
                  ));
                })));
  }
}
