import 'package:flutter/material.dart';
import 'package:list/database/token_db.dart';
import 'package:list/widgets/primaryButton.dart';
import 'package:list/widgets/safeScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _logout(){
    deleteToken();
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return SafeScreen(child: PrimaryButton(text: 'Logout', onTap:_logout)
    );
  }
}
