import 'package:flutter/material.dart';
import 'package:list/style/theme.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 28,
          color: primary,
        ),
      ),
    );
  }
}
