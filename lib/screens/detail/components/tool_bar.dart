import 'package:ar_list/components/category_dropdown.dart';
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

  categoryChange(BuildContext context, Category category, WidgetRef ref) {
    ref.read(currentCategory.notifier).state = category;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<SortType> sortType = ref.read(entrySortType.notifier);
    final list = ref.watch(currentList);
    final inList = list.items.where((element) => element!.got);
    final key = Key(list.hashCode.toString());
    bool alpha = sortType.state == SortType.alpha;
    bool cat = sortType.state == SortType.category;
    StateController<Category> category = ref.read(currentCategory.notifier);
    final ValueNotifier<IconData> iconData = useState<IconData>(alpha
        ? Icons.arrow_downward_rounded
        : cat
            ? Icons.category
            : Icons.arrow_upward_rounded);
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
                child: CategoryDropdown(key, category.state, (value) {
                  categoryChange(context, value, ref);
                })),
          ),
          Tooltip(
            message: alpha || cat ? S.of(context).asc : S.of(context).desc,
            child: IconButton(
                icon: Icon(iconData.value),
                onPressed: () {
                  bool alpha = sortType.state == SortType.alpha;
                  bool cat = sortType.state == SortType.category;
                  sortType.state = cat
                      ? SortType.alpha
                      : alpha
                          ? SortType.inversedAlpha
                          : SortType.category;
                  iconData.value = cat
                      ? Icons.arrow_downward_rounded
                      : alpha
                          ? Icons.arrow_upward_rounded
                          : Icons.category;
                },
                color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
