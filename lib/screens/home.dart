import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list/widgets/list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[200],
      child: Center(
        child: ListWidget(),
      ),
    );
  }
}
