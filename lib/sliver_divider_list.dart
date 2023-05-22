part of 'divider_list.dart';

/// A sliver that places multiple box children and separators in a linear array along the main
/// axis.
class SliverDividerList extends AbstractDividerWidget {
  const SliverDividerList({
    super.key,
    required super.mainListItemBuilder,
    required super.dividerListItemBuilder,
    super.itemIfDividerListLengthIsShort,
    super.itemIfMainListLengthIsShort,
    required super.mainListItemLength,
    required super.dividerListItemLength,
  });
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        getWidget,
        childCount: _itemCount(),
      ),
    );
  }
}
