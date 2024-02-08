import 'package:ar_list/business/ShopList/event.dart';
import 'package:ar_list/components/confirmation.dart';
import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/models/shop_list.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Lists extends ConsumerStatefulWidget {
  final Set<ShopList> lists;

  Lists(this.lists);

  @override
  ConsumerState createState() => _ListsWidgetState(lists);
}

class _ListsWidgetState extends ConsumerState<Lists> {
  final Set<ShopList> lists;
  final _biggerFont = TextStyle(fontSize: 18.0);
  static const platform = const MethodChannel('app.channel.shared.data');

  _ListsWidgetState(this.lists);

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    SystemChannels.lifecycle.setMessageHandler((msg) {
      return _getSharedData().then((d) {
        if (d.isEmpty) return;
        addList(d);
        return null;
      });
    });

    _getSharedData().then((d) => addList(d));
  }

  addList(Map listData) {
    String? text = (listData == null)
        ? ''
        : (listData["data"] == null)
            ? listData["text"]
            : listData["data"];
    setState(() {
      if (text != null) {
        ref.read(shopListNotifierProvider.notifier).event(ImportEvent(text));
      }
    });
  }

  Future<Map> _getSharedData() async =>
      await platform.invokeMethod('getSharedData');

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
                ref.read(currentList.notifier).state = lists.elementAt(i);
                Navigator.pushNamed(context, '/detail').whenComplete(() {
                  if (mounted) {
                    setState(() {
                      ref.read(filtersNotifierProvider).clear();
                    });
                  } else {
                    //context.read(filtersNotifierProvider).clear();
                  }
                });
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
    ref.read(shopListNotifierProvider.notifier).event(AddEvent(list));
  }

  void delete(i) {
    Confirmation.show(context, S.of(context).remove_list_confirmation, () {
      ref.read(shopListNotifierProvider.notifier).event(RemoveEvent(i));
      Navigator.of(context).pop();
    }, () {
      Navigator.of(context).pop();
    });
  }
}
