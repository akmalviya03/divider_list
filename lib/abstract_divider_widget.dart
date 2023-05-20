part of 'divider_list.dart';

abstract class AbstractDividerWidget extends StatelessWidget {
  const AbstractDividerWidget(
      {Key? key,
        required this.mainListItemBuilder,
        required this.dividerListItemBuilder,
        this.itemIfDividerListLengthIsShort,
        this.itemIfMainListLengthIsShort,
        required this.mainListItemLength,
        required this.dividerListItemLength})
      : _dividerListIsBiggerOrEqualInLength = dividerListItemLength >= mainListItemLength,super(key: key);
  final Widget Function(BuildContext context, int index) mainListItemBuilder;
  final Widget Function(BuildContext context, int index) dividerListItemBuilder;
  final Widget? itemIfDividerListLengthIsShort;
  final Widget? itemIfMainListLengthIsShort;
  final int mainListItemLength;
  final int dividerListItemLength;
  ///Final List Length
  ///It will always hold the largest list length among the [mainListItemLength] and [dividerListItemLength]
  final bool _dividerListIsBiggerOrEqualInLength;
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
        return itemIfMainListLengthIsShort ?? const Divider();
      }
    }
  }

  int? _itemCount() {
    return math.max(
        0,
        _dividerListIsBiggerOrEqualInLength
            ? (dividerListItemLength * 2)
            : (mainListItemLength * 2 - 1));
  }
}