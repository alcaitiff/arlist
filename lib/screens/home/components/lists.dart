import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/components/confirmation.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:hooks_riverpod/all.dart';

class Lists extends StatefulWidget {
  final Set<ShopList> lists;

  Lists(this.lists);

  @override
  _ListsWidgetState createState() => _ListsWidgetState(lists);
}

class _ListsWidgetState extends State<Lists> {
  final Set<ShopList> lists;
  final _biggerFont = TextStyle(fontSize: 18.0);

  _ListsWidgetState(this.lists);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      return ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: lists.length,
          itemBuilder: /*1*/ (context, i) {
            return Card(
                child: ListTile(
              trailing: showPopup(i),
              title: Text(
                lists.elementAt(i).name,
                style: _biggerFont,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/detail',
                    arguments: lists.elementAt(i));
              },
            ));
          });
    });
  }

  Widget showPopup(i) {
    return PopupMenuButton<int>(
        icon: const Icon(Icons.more_horiz),
        itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text(S.of(context).copy),
              ),
              PopupMenuItem(
                value: 1,
                child: Text(S.of(context).rename),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(S.of(context).remove),
              ),
            ],
        onSelected: (value) {
          switch (value) {
            case 0:
              copy(i);
              break;
            case 1:
              rename(i);
              break;
            case 2:
              delete(i);
              break;
            default:
          }
        });
  }

  void rename(i) {
    Navigator.pushNamed(context, '/rename', arguments: lists.elementAt(i));
  }

  void copy(i) {
    ShopList list = lists.elementAt(i).clone();
    list.name += ' (' + S.of(context).copy_sufix + ')';
    context.read(shopListNotifierProvider).event(AddEvent(list));
  }

  void delete(i) {
    Confirmation.show(context, S.of(context).remove_list_confirmation, () {
      context.read(shopListNotifierProvider).event(RemoveEvent(i));
      Navigator.of(context).pop();
    }, () {
      Navigator.of(context).pop();
    });
  }
}
