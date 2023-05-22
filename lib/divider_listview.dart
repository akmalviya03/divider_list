part of 'divider_list.dart';
/// Creates a scrollable, linear array of main Item widgets and separator widgets on demand.
class DividerListView extends AbstractDividerWidget {
  const DividerListView(
      {super.key,
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
  /// An object that can be used to control the position to which this scroll
  /// view is scrolled.
  ///
  /// Must be null if [primary] is true.
  ///
  /// A [ScrollController] serves several purposes. It can be used to control
  /// the initial scroll position (see [ScrollController.initialScrollOffset]).
  /// It can be used to control whether the scroll view should automatically
  /// save and restore its scroll position in the [PageStorage] (see
  /// [ScrollController.keepScrollOffset]). It can be used to read the current
  /// scroll position (see [ScrollController.offset]), or change it (see
  /// [ScrollController.animateTo]).
  final ScrollController? controller;
  /// Whether the scroll view scrolls in the reading direction.
  ///
  /// For example, if the reading direction is left-to-right and
  /// [scrollDirection] is [Axis.horizontal], then the scroll view scrolls from
  /// left to right when [reverse] is false and from right to left when
  /// [reverse] is true.
  ///
  /// Similarly, if [scrollDirection] is [Axis.vertical], then the scroll view
  /// scrolls from top to bottom when [reverse] is false and from bottom to top
  /// when [reverse] is true.
  ///
  /// Defaults to false.
  final bool reverse;
  /// Whether the extent of the scroll view in the [scrollDirection] should be
  /// determined by the contents being viewed.
  ///
  /// If the scroll view does not shrink wrap, then the scroll view will expand
  /// to the maximum allowed size in the [scrollDirection]. If the scroll view
  /// has unbounded constraints in the [scrollDirection], then [shrinkWrap] must
  /// be true.
  ///
  /// Shrink wrapping the content of the scroll view is significantly more
  /// expensive than expanding to the maximum allowed size because the content
  /// can expand and contract during scrolling, which means the size of the
  /// scroll view needs to be recomputed whenever the scroll position changes.
  ///
  /// Defaults to false.
  final bool shrinkWrap;
  /// Indicates that the primary scroll view is associated with the parent
  /// [PrimaryScrollController].
  ///
  /// When this is true, the scroll view is scrollable even if it does not have
  /// sufficient content to actually scroll. Otherwise, by default the user can
  /// only scroll the view if it has sufficient content.
  final bool? primary;
  /// How the scroll view should respond to user input.
  final ScrollPhysics? physics;
  //Padding around the list
  final EdgeInsets? padding;
  /// Scrolling direction of the listview
  /// Defaults to [Axis.vertical].
  final Axis scrollDirection;
  /// [ScrollViewKeyboardDismissBehavior] the defines how this [ScrollView] will
  /// dismiss the keyboard automatically. Default to [ScrollViewKeyboardDismissBehavior.manual]
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  ///The content will be clipped (or not) according to this option.
  final Clip clipBehavior;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      reverse: reverse,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      padding: padding,
      scrollDirection: scrollDirection,
      keyboardDismissBehavior: keyboardDismissBehavior,
      clipBehavior: clipBehavior,
      itemBuilder: getWidget,
      itemCount: _itemCount(),
    );
  }
}