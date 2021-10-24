import 'package:flutter/material.dart';
import 'package:list/call_db/token.dart';
import 'package:list/model/token_model.dart';
import 'package:list/style/ListIcons.dart';
import 'package:list/style/theme.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late Future<TokenModel> futureToken;

  void goToNextPage() async{

    await futureToken;

    await Future.delayed(Duration(seconds: 2));

    Navigator.pushNamed(context, '/login');
  }

  @override
  void initState() {
    futureToken = getToken();
    goToNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeList.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Icon(
                ListIcons.check,
                size: 100,
                color: themeList.primaryColor,
              ),
              Text('List'),
              SizedBox(
                height: 250,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
