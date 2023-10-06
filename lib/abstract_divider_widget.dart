part of 'divider_list.dart';

///Core class for the functionality of [SliverDividerList] and [DividerListView]
abstract class AbstractDividerWidget extends StatelessWidget {
  const AbstractDividerWidget(
      {Key? key,
      required this.mainListItemBuilder,
      required this.dividerListItemBuilder,
      this.itemIfDividerListLengthIsShort,
      this.itemIfMainListLengthIsShort,
      required this.mainListItemLength,
      required this.dividerListItemLength})
      : _dividerListIsBiggerOrEqualInLength =
            dividerListItemLength >= mainListItemLength,
        super(key: key);

  ///Function that creates a main list item for a given index
  final Widget Function(BuildContext context, int index) mainListItemBuilder;

  ///Function that creates a divider list item for a given index
  final Widget Function(BuildContext context, int index) dividerListItemBuilder;

  ///Default separator item if divider list length is short as compared to main list
  final Widget? itemIfDividerListLengthIsShort;

  ///Default list item if main list length is short as compared to divider list
  final Widget? itemIfMainListLengthIsShort;

  ///Total number of items in mainList
  final int mainListItemLength;

  ///Total number of items in dividerList
  final int dividerListItemLength;

  ///Final List Length
  ///It will always hold the largest list length among the [mainListItemLength] and [dividerListItemLength]
  final bool _dividerListIsBiggerOrEqualInLength;

  ///Function responsible for calculating index for both mainList and divider also invokes their respective builders.
  Widget getWidget(BuildContext context, int index) {
    if (index.isEven) {
      final int itemIndex = index ~/ 2;
      if (itemIndex < mainListItemLength) {
        return mainListItemBuilder(context, itemIndex);
      } else {
        return itemIfMainListLengthIsShort ?? const Divider();
      }
    } else {
      final int itemIndex = (index / 2).floor();
      if (itemIndex < dividerListItemLength) {
        return dividerListItemBuilder(context, itemIndex);
      } else {
        return itemIfDividerListLengthIsShort ?? const Divider();
      }
    }
  }

  ///Function responsible for deciding which list length we should use for rendering of items
  int? _itemCount() {
    return math.max(
        0,
        _dividerListIsBiggerOrEqualInLength
            ? (dividerListItemLength * 2)
            : (mainListItemLength * 2 - 1));
  }
}
