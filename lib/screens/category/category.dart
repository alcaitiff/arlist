import 'package:flutter/material.dart';
import 'package:ar_list/screens/category/components/body.dart';
import 'package:ar_list/generated/l10n.dart';

class CategoryScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).categories),
          ),
          body: Body(_formKey),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        });
  }
}
