part of 'divider_list.dart';

class SliverDividerList extends AbstractDividerWidget {
  const SliverDividerList({
    Key? super.key,
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
