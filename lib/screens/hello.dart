import 'package:flutter/material.dart';
import 'package:list/style/ListIcons.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/safeScreen.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeScreen(
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
    );
  }
}
