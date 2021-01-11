import 'package:ar_list/models/shop_list.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/screens/create/components/body.dart';
import 'package:ar_list/generated/l10n.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShopList _list = ShopList('');
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).create_list),
      ),
      body: Body(_list),
    );
  }
}
