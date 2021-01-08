import 'package:ar_list/models/shop_list.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/screens/rename/components/body.dart';
import 'package:ar_list/generated/l10n.dart';

class RenameScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ShopList _list = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).rename_list),
      ),
      body: Body(this._formKey, _list),
    );
  }
}
