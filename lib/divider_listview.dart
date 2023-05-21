part of 'divider_list.dart';

class DividerListView extends AbstractDividerWidget {
  const DividerListView(
      {Key? super.key,
      required super.mainListItemBuilder,
      required super.dividerListItemBuilder,
      super.itemIfDividerListLengthIsShort,
      super.itemIfMainListLengthIsShort,
      required super.mainListItemLength,
      required super.dividerListItemLength,
      this.controller,
      this.reverse = false,
      this.shrinkWrap = false,
      this.primary,
      this.physics,
      this.padding,
      this.scrollDirection = Axis.vertical,
      this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
      this.clipBehavior = Clip.hardEdge});
  final ScrollController? controller;
  final bool reverse;
  final bool shrinkWrap;
  final bool? primary;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final Axis scrollDirection;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Clip clipBehavior;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: scrollDirection,
      keyboardDismissBehavior: keyboardDismissBehavior,
      padding: padding,
      reverse: reverse,
      controller: controller,
      physics: physics,
      shrinkWrap: shrinkWrap,
      primary: primary,
      itemBuilder: getWidget,
      itemCount: _itemCount(),
    );
  }
}