import 'package:ar_list/models/shop_list.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/screens/add/components/body.dart';
import 'package:ar_list/generated/l10n.dart';

class AddScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ShopList _list = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_items),
      ),
      body: Body(_formKey, _list),
    );
  }
}
