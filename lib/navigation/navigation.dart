import 'package:flutter/material.dart';
import 'package:list/navigation/startPage.dart';
import 'package:list/screens/login.dart';
import 'package:list/screens/register.dart';
import 'package:list/style/theme.dart';
class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeList,
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/hello': (context) => StartPage(),
        '/home': (context) => StartPage(),
        '/share': (context) => StartPage(),
        '/profile': (context) => StartPage(),
      },
      // initialize all routes


    );
  }
}
