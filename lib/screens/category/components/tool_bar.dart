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
              onPressed: () => sortType.state = SortType.alpha,
              color: Theme.of(context).primaryColor),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sortType = useProvider(categorySortType);
    List<Category> list =
        context.read(categoryRepositoryProvider).data.toList();
    final filter = useProvider(categoryFilter);
    final key = Key(list.hashCode.toString());
    return Material(
      key: key,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${list.length - 1} ${S.of(context).left_categories}',
            overflow: TextOverflow.ellipsis,
          ),
          sorter(context, sortType)
        ],
      ),
    );
  }
}
