import 'package:ar_list/models/shop_list.dart';
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
  final ShopListRepository repository = ShopListRepository.instance;

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
      repository.write();
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
            key: widget.formKey,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: widget.list.items.length,
                itemBuilder: /*1*/ (context, i) {
                  return Card(
                      child: ListTile(
                    //trailing: showPopup(i),
                    title: Text(
                      widget.list.items.elementAt(i).item.name,
                      //style: _biggerFont,
                    ),
                    onTap: () {
                      //Navigator.pushNamed(context, '/detail', arguments: lists.elementAt(i));
                    },
                  ));
                })));
  }
}
