import 'package:flutter/material.dart';
import 'package:list/screens/startPage.dart';
import 'package:list/screens/hello.dart';
import 'package:list/screens/home.dart';
import 'package:list/screens/login.dart';
import 'package:list/screens/profile.dart';
import 'package:list/screens/register.dart';
import 'package:list/screens/share.dart';
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
        '/hello': (context) => Hello(),
        '/home': (context) => Home(),
        '/share': (context) => Share(),
        '/profile': (context) => Profile(),
      },
      // initialize all routes


    );
  }
}
