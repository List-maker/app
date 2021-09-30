import 'package:flutter/material.dart';
import 'package:list/fetch_api/userCalls.dart';
import 'package:list/model/user_model.dart';
import 'package:list/style/theme.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  late Future<UserModel> futureUser;

  @override
  void initState() {
    futureUser = fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<UserModel>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Text('Hello ' + snapshot.data!.username +  ' !',
              style: themeList.textTheme.headline1,),
            );
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator(
            color: Color.fromRGBO(72, 47, 247, 1),
          );
        },
      ),
    );
  }
}
