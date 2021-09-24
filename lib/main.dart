import 'package:flutter/material.dart';
import 'package:list/screens/start.dart';
import 'package:list/style/theme.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE token(id INTEGER PRIMARY KEY, refresh_token TEXT, access_token TEXT)',
      );
    },
    version: 1,
  );

  final db = await database;

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: themeList,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
        body: StartPage(),
      ),
    );
  }
}
