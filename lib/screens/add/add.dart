import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/screens/add/components/body.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:hooks_riverpod/all.dart';

class AddScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ShopList _list = context.read(currentList).state;
    final listProvider = StateProvider<ShopList>((ref) => _list);
    return GestureDetector(
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).add_items),
          ),
          body: Body(_formKey, listProvider),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        });
  }
}
