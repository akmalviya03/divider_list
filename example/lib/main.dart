import 'package:divider_list/divider_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Widget> mainList = <Widget>[
    Container(
      height: 200,
      color: Colors.black,
    ),
    Container(
      height: 200,
      color: Colors.brown,
    ),
    Container(
      height: 200,
      color: Colors.red,
    ),
    Container(
      height: 200,
      color: Colors.green,
    ),
    Container(
      height: 200,
      color: Colors.blue,
    ),
    Container(
      height: 200,
      color: Colors.yellow,
    ),
  ];

  final List<Widget> dividerList = <Widget>[
    const SizedBox(
      height: 100,
      child: Text('One'),
    ),
    const SizedBox(
      height: 100,
      child: Text('Two'),
    ),
    const SizedBox(
      height: 100,
      child: Text('Three'),
    ),
    const SizedBox(
      height: 100,
      child: Text('Four'),
    ),
    const SizedBox(
      height: 100,
      child: Text('Five'),
    ),
    const SizedBox(
      height: 100,
      child: Text('Six'),
    ),
    const SizedBox(
      height: 100,
      child: Text('Seven'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DividerListView(
        mainListItemBuilder: (BuildContext context, int index) {
          return mainList[index];
        },
        dividerListItemBuilder: (BuildContext context, int index) {
          return dividerList[index];
        },
        mainListItemLength: mainList.length,
        dividerListItemLength: dividerList.length,
      ),
    );
  }
}
