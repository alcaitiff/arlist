import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/screens/detail/components/body.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:hooks_riverpod/all.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ShopList _list;
  bool pushed = false;
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
    _list = context.read(currentList).state;
    if (_list.items.isEmpty && !pushed) {
      pushed = true;
      Future.microtask(() =>
          Navigator.pushNamed(context, '/add').whenComplete(() => setState(() {
                context.read(entryFilter).state = '';
              })));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_list.name),
      ),
      body: Body(_formKey, _list),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add').whenComplete(() => setState(() {
                context.read(entryFilter).state = '';
              }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
