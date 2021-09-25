import 'package:flutter/material.dart';
import 'package:list/fetch_api/user.dart';
import 'package:list/model/user_model.dart';

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
            return Text('Hello' + snapshot.data!.username);
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
