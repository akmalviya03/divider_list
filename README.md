A List that places items of another list as a divider between each item.

## Features

1. Support for both SliverList and ListView
2. Easy to use : You only need to pass lengths of both lists

## Usage

### SliverDividerList

```dart
SliverDividerList(mainListItemBuilder: (BuildContext context, int index) {
   return mainList[index];
 },
 dividerListItemBuilder: (BuildContext context, int index) {
   return dividerList[index];
 },
 mainListItemLength: mainList.length,
 dividerListItemLength: dividerList.length,
),
```

### DividerListView

```dart
DividerListView(mainListItemBuilder: (BuildContext context, int index) {
   return mainList[index];
 },
 dividerListItemBuilder: (BuildContext context, int index) {
   return dividerList[index];
 },
 mainListItemLength: mainList.length,
 dividerListItemLength: dividerList.length,
),
```

