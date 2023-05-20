part of 'divider_list.dart';

class DividerListView extends AbstractDividerWidget {
  const DividerListView(
      {Key? super.key,
      required super.mainListItemBuilder,
      required super.dividerListItemBuilder,
      super.itemIfDividerListLengthIsShort,
      super.itemIfMainListLengthIsShort,
      required super.mainListItemLength,
      required super.dividerListItemLength});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: getWidget,
      itemCount: _itemCount(),
    );
  }
}