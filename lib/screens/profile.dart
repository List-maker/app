import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list/call_db/token.dart';
import 'package:list/style/theme.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _onLogOutPressed() async {
    deleteToken();

    //TODO : demander si il veulent
    // if (Platform.isAndroid) {
    //   SystemNavigator.pop();
    // } else if (Platform.isIOS) {
    //   exit(0);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
          onTap: _onLogOutPressed,
          child: Container(
            height: 50,
            width: 200,
            decoration: morphOut.copyWith(
              gradient: primaryOut,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(child: Text('Log out')),
          ),
        ),
      ),
    );
  }
}
