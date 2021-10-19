import 'package:flutter/material.dart';
import 'package:list/navigation/startPage.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/login': (context) => StartPage(),
        '/register': (context) => StartPage(),
        '/hello': (context) => StartPage(),
        '/home': (context) => StartPage(),
        '/share': (context) => StartPage(),
        '/profile': (context) => StartPage(),
      },
      // initialize all routes

    );
  }
}
