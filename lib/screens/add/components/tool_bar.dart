import 'package:ar_list/components/category_selector.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ar_list/generated/l10n.dart';

class Toolbar extends HookWidget {
  const Toolbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortType = useProvider(shopItemSortType);
    final list = useProvider(currentList).state;
    final filter = useProvider(shopItemFilter);
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${list.items.length} ${S.of(context).left_items}',
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: CategorySelector()),
          ),
          (sortType.state == SortType.alpha)
              ? Tooltip(
                  message: S.of(context).asc,
                  child: IconButton(
                      icon: Icon(Icons.arrow_downward_rounded),
                      onPressed: () => sortType.state = SortType.inversedAlpha,
                      color: Theme.of(context).primaryColor),
                )
              : Tooltip(
                  message: S.of(context).desc,
                  child: IconButton(
                      icon: Icon(Icons.arrow_upward_rounded),
                      onPressed: () => sortType.state = SortType.alpha,
                      color: Theme.of(context).primaryColor),
                ),
        ],
      ),
    );
  }
}
