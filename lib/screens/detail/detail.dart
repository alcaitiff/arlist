import 'package:ar_list/models/shop_list.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/screens/detail/components/body.dart';
import 'package:ar_list/generated/l10n.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
        title: Text(_list.name),
      ),
      body: Body(_formKey, _list),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add', arguments: _list)
              .whenComplete(() => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
