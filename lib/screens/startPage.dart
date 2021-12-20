import 'package:flutter/material.dart';
import 'package:list/api/userCalls.dart';
import 'package:list/database/user_db.dart';
import 'package:list/model/token_model.dart';
import 'package:list/model/user_model.dart';
import 'package:list/style/List_icons.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/morphOut.dart';
import 'package:list/widgets/safeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late Future<TokenModel> futureToken;
  late Future<UserModel> futureUser;

  void goToNextPage() async {
    final prefs = await SharedPreferences.getInstance();

    await fetchUser();
    final token = prefs.getString('access-token');
    print(token);

    await Future.delayed(Duration(seconds: 2));
    if (token == null) {
      Navigator.pushNamed(context, '/register');
    } else if (token == 'null') {
      Navigator.pushNamed(context, '/login');
    } else {
      try {
        saveUser(await fetchUser());
        Navigator.pushNamed(context, '/hello');
      } catch (error) {
        Navigator.pushNamed(context, '/login');
      }
    }
  }

  @override
  void initState() {
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
            MorphOut(
              child: Icon(
                IcList.check_checked,
                size: 125,
                color: themeList.primaryColor,
              ),
              decorationOverride: morphOut.copyWith(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .45),
                    blurRadius: 8,
                    offset: Offset(2, 2),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    blurRadius: 8,
                    offset: Offset(-2, -2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              "List",
              style: TextStyle(color: themeList.primaryColor, fontSize: 50),
            ),
            Spacer(
              flex: 2,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              "made by Raphou.",
              style: TextStyle(
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
