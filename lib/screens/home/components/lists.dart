import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers/shop_list_provider.dart';
import 'package:ar_list/routes.dart';
import 'package:ar_list/screens/home/components/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';

class Lists extends StatefulWidget {
  final Set<ShopList> lists;

  Lists(this.lists);

  @override
  _ListsWidgetState createState() => _ListsWidgetState(lists);
}

class _ListsWidgetState extends State<Lists> {
  final Set<ShopList> lists;
  final _biggerFont = TextStyle(fontSize: 18.0);
  final ShopListProvider provider = ShopListProvider.instance;

  _ListsWidgetState(this.lists);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: lists.length,
        itemBuilder: /*1*/ (context, i) {
          return Card(
              child: ListTile(
            trailing: deleteButton(i),
            title: Text(
              lists.elementAt(i).name,
              style: _biggerFont,
            ),
            onTap: () {
              // open list
            },
          ));
        });
  }

  Widget deleteButton(i) {
    return IconButton(
      icon: const Icon(Icons.delete_forever),
      color: Colors.red,
      onPressed: () {
        Confirmation.show(context, S.of(context).remove_list_confirmation, () {
          setState(() {
            lists.remove(lists.elementAt(i));
            provider.write();
          });
          Navigator.of(context).pop();
          if (lists.isEmpty) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: routes['/']));
          }
        }, () {
          Navigator.of(context).pop();
        });
      },
    );
  }
}
