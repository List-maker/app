import 'package:flutter/material.dart';
import 'package:list/api/userCalls.dart';
import 'package:list/database/token_db.dart';
import 'package:list/database/user_db.dart';
import 'package:list/model/token_model.dart';
import 'package:list/model/user_model.dart';
import 'package:list/style/ListIcons.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/safeScreen.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late Future<TokenModel> futureToken;
  late Future<UserModel> futureUser;

  void goToNextPage() async{

    final token = await futureToken;
    final user = await futureUser;

    print(token.accessToken);
    print(user.id);
    await Future.delayed(Duration(seconds: 2));
    if (token.accessToken != 'null'){
      Navigator.pushNamed(context, '/home');
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  void initState() {
    futureToken = getToken();
    futureUser = getUser();
    goToNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeScreen(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Container(child: Icon(
                ListIcons.check,
                size: 100,
                color: whiteText,
              ),
              ),
              Text('List'),
              SizedBox(
                height: 250,
              ),
              Spacer(),
            ],
          ),
        ),
    );
  }
}
