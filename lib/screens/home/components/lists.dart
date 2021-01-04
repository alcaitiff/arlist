import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers/shop_list_provider.dart';
import 'package:flutter/material.dart';

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
            trailing: IconButton(
              icon: const Icon(Icons.delete_forever),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  lists.remove(lists.elementAt(i));
                  provider.write();
                });
              },
            ),
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
}
