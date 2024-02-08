import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/routes.dart';
import 'package:ar_list/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).lists),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: routes['/create']!));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
