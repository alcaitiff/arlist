import 'package:ar_list/routes.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/screens/home/components/body.dart';
import 'package:ar_list/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: Text(S.of(context).lists),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: routes['/create']));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
