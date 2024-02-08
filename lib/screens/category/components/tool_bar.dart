import 'package:ar_list/generated/l10n.dart';
import 'package:ar_list/models/category.dart';
import 'package:ar_list/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Toolbar extends HookConsumerWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<SortType> sortType = ref.read(categorySortType.notifier);
    List<Category> list = ref.watch(categoryRepositoryProvider).data.toList();
    String filter = ref.watch(categoryFilter);
    final key = Key(list.hashCode.toString());
    bool alpha = sortType.state == SortType.alpha;
    final ValueNotifier<IconData> iconData = useState<IconData>(
        alpha ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded);
    return Material(
      key: key,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${list.length - 1} ${S.of(context).left_categories}',
            overflow: TextOverflow.ellipsis,
          ),
          Tooltip(
            message: alpha ? S.of(context).asc : S.of(context).desc,
            child: IconButton(
                icon: Icon(iconData.value),
                onPressed: () {
                  bool alpha = sortType.state == SortType.alpha;
                  sortType.state =
                      alpha ? SortType.inversedAlpha : SortType.alpha;
                  iconData.value = alpha
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_downward_rounded;
                },
                color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
