import 'package:ar_list/models/shop_item.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/repositories/shop_item_repository.dart';
import 'package:ar_list/repositories/shop_list_repository.dart';
import 'package:ar_list/routes.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';

class Body extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ShopList list;

  @override
  _BodyState createState() => _BodyState();

  Body(this.formKey, this.list);
}

class _BodyState extends State<Body> {
  final ShopListRepository listRepository = ShopListRepository.instance;
  final ShopItemRepository itemRepository = ShopItemRepository.instance;
  Set<ShopItem> itemList;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void submit(context) {
    if (widget.formKey.currentState.validate()) {
      listRepository.write();
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: routes['/']));
    }
  }

  Future<void> getList() {}

  @override
  Widget build(BuildContext context) {
    return Text('TODO');
  }
/*
  @override
  Widget build(BuildContext context) {
    String name;
    return FutureBuilder(
    future:,
    builder: 
    return SafeArea(
        top: false,
        bottom: false,
        child: new Form(
            key: widget.formKey,
            child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: S.of(context).list_name_hint,
                      labelText: S.of(context).list_name,
                    ),
                    onChanged: (String newValue) {
                      name = newValue.trim();
                    },
                    onEditingComplete: () {
                      submit(name);
                      name = null;
                    },
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return S.of(context).error_empty_value;
                      }
                      return null;
                    },
                  ),
                  ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: itemList.length,
                      itemBuilder: /*1*/ (context, i) {
                        return Card(
                            child: ListTile(
                          //trailing: showPopup(i),
                          title: Text(
                            itemList.elementAt(i).name,
                            //style: _biggerFont,
                          ),
                          onTap: () {
                            //Navigator.pushNamed(context, '/detail', arguments: lists.elementAt(i));
                          },
                        ));
                      })
                ])));
  }
  */
}
