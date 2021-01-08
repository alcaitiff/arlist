import 'package:ar_list/models/shop_list.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/screens/add/components/body.dart';
import 'package:ar_list/generated/l10n.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  ShopList _list;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _list = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_items),
      ),
      body: Body(_formKey, _list),
    );
  }
}
