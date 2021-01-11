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

    Color textColorFor(SortType value) {
      return sortType.state == value
          ? Theme.of(context).primaryColor
          : Theme.of(context).disabledColor;
    }

    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${useProvider(filteredShopItems).length} ${S.of(context).left_items}',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Tooltip(
            message: S.of(context).asc,
            child: IconButton(
                icon: Icon(Icons.arrow_downward_rounded),
                onPressed: () => sortType.state = SortType.alpha,
                color: textColorFor(SortType.alpha)),
          ),
          Tooltip(
            message: S.of(context).desc,
            child: IconButton(
                icon: Icon(Icons.arrow_upward_rounded),
                onPressed: () => sortType.state = SortType.inversedAlpha,
                color: textColorFor(SortType.inversedAlpha)),
          ),
        ],
      ),
    );
  }
}
