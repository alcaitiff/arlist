import 'package:ar_list/components/category_dropdown.dart';
import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ar_list/generated/l10n.dart';

class Toolbar extends HookWidget {
  const Toolbar({
    Key key,
  }) : super(key: key);

  sorter(BuildContext context, StateController sortType) {
    switch (sortType.state) {
      case SortType.alpha:
        return Tooltip(
          message: S.of(context).asc,
          child: IconButton(
              icon: Icon(Icons.arrow_downward_rounded),
              onPressed: () => sortType.state = SortType.inversedAlpha,
              color: Theme.of(context).primaryColor),
        );
        break;
      case SortType.inversedAlpha:
        return Tooltip(
          message: S.of(context).desc,
          child: IconButton(
              icon: Icon(Icons.arrow_upward_rounded),
              onPressed: () => sortType.state = SortType.category,
              color: Theme.of(context).primaryColor),
        );
        break;
      case SortType.category:
        return Tooltip(
          message: S.of(context).desc,
          child: IconButton(
              icon: Icon(Icons.category),
              onPressed: () => sortType.state = SortType.alpha,
              color: Theme.of(context).primaryColor),
        );
        break;
    }
  }

  categoryChange(BuildContext context, Category category) {
    context.read(currentCategory).state = category;
  }

  @override
  Widget build(BuildContext context) {
    final sortType = useProvider(shopItemSortType);
    final list = useProvider(currentList).state;
    final filter = useProvider(shopItemFilter);
    final key = Key(list.hashCode.toString());
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${list.items.length} ${S.of(context).left_items}',
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 0),
              child: CategoryDropdown(key, context.read(currentCategory).state,
                  (value) {
                categoryChange(context, value);
              })),
          IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).hintColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/category').whenComplete(() {
                  filter.state += '';
                });
              }),
          sorter(context, sortType)
        ],
      ),
    );
  }
}
