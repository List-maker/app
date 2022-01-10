import 'package:flutter/material.dart';
import 'package:list/database/user_db.dart';
import 'package:list/model/user_model.dart';
import 'package:list/widgets/safeScreen.dart';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  late Future<UserModel> futureUser;

  void goToNextPage() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamed(context, '/app/home');
  }

  @override
  void initState() {
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
            FutureBuilder<UserModel>(
                future: futureUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      'Hello ' + snapshot.data!.username,
                      style: TextStyle(fontSize: 40),
                    );
                  }
                  return Container();
                }),
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
