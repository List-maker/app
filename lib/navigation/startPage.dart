import 'package:flutter/material.dart';
import 'package:list/call_db/token.dart';
import 'package:list/model/token_model.dart';
import 'package:list/style/theme.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late Future<TokenModel> futureToken;

  @override
  void initState() {
    futureToken = getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeList.backgroundColor,
        body: Center(child: Text('hello')),
      ),
    );
  }
}
