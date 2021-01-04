import 'package:ar_list/models/shop_list.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/screens/create/components/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  ShopList _list = ShopList('');
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).create_list),
      ),
      body: Body(this._formKey, this._list),
    );
  }
}
