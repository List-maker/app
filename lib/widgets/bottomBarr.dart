import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarr extends StatefulWidget {
  const BottomBarr({Key? key}) : super(key: key);

  @override
  _BottomBarrState createState() => _BottomBarrState();
}

class _BottomBarrState extends State<BottomBarr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 10,
      width: 40,
    );
  }
}
