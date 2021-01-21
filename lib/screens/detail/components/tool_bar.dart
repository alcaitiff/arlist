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
    final sortType = useProvider(entrySortType);
    final filter = useProvider(entryFilter);
    final list = useProvider(currentList).state;
    final inList = list.items.where((element) => element.got);
    final category = useProvider(currentCategory).state;
    final key = Key(list.hashCode.toString());
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${inList.length}/${list.items.length}',
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: CategoryDropdown(
                    key, context.read(currentCategory).state, (value) {
                  categoryChange(context, value);
                })),
          ),
          sorter(context, sortType)
        ],
      ),
    );
  }
}
