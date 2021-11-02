import 'package:flutter/material.dart';
import 'package:list/widgets/safeScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeScreen(
      title: "Home",
      child: Center(
        child: Text("data"),
      ),
    );
  }
}
