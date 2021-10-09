import 'package:flutter/material.dart';
import 'package:list/call_db/token.dart';
import 'package:list/fetch_api/userCalls.dart';
import 'package:list/model/user_model.dart';
import 'package:list/navigation/navigation.dart';
import 'package:list/screens/login.dart';
import 'package:list/screens/register.dart';
import 'package:list/style/theme.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late Future<Object> futureToken;
  late Future<UserModel> futureUser;

  @override
  void initState() {
    super.initState();
    futureToken = getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeList.backgroundColor,
      body: Center(
        child: FutureBuilder<Object>(
          future: futureToken,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return RegisterNavigation();
            } else if (snapshot.hasData) {
              futureUser = fetchUser();
              return FutureBuilder<UserModel>(
                future: futureUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Application();
                  } else if (snapshot.hasError) {
                    if (snapshot.error.toString() ==
                        'Exception: invalid token !') {
                      return LoginNavigation();
                    } else {
                      //TODO : print error in alert
                      print('ERROR [call API](/api/user): ${snapshot.error}');
                      return Text('${snapshot.error}');
                    }
                  }

                  return Scaffold(
                    backgroundColor: themeList.backgroundColor,
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              print('ERROR [get Token]: ${snapshot.error}');
              return Text('ERROR [get Token]: ${snapshot.error}');
            }

            return CircularProgressIndicator(
              color: Color.fromRGBO(72, 47, 247, 1),
              strokeWidth: 40,
            );
          },
        ),
      ),
    );
  }
}
