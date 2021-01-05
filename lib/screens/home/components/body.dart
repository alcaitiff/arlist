import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers/shop_list_provider.dart';
import 'package:ar_list/screens/home/components/lists.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';

class Body extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<Body> {
  Future<Set<ShopList>> _lists;
  @override
  void initState() {
    super.initState();
    ShopListProvider provider = ShopListProvider.instance;
    _lists = provider.read();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<ShopList>>(
      future: _lists,
      builder: (BuildContext context, AsyncSnapshot<Set<ShopList>> snapshot) {
        if (snapshot.hasData) {
          return _buildLists(snapshot.data);
        } else {
          return Text(S.of(context).loading);
        }
      },
    );
  }

  Widget _buildLists(Set<ShopList> lists) {
    if (lists.isEmpty) {
      return Center(
        child: Text(S.of(context).no_lists),
      );
    } else {
      return Center(
        child: Lists(lists),
      );
    }
  }
}
