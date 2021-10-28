import 'package:flutter/material.dart';
import 'package:list/navigation/navigation.dart';
import 'package:list/style/theme.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE token(id INTEGER PRIMARY KEY, refresh_token TEXT, access_token TEXT); CREATE TABLE user(id INTEGER PRIMARY KEY, username TEXT,	email TEXT, pinned_lists JSON, settings JSON);',
      //TODO : pined list c'est pas un text
      );
    },
    version: 1,
  );
  final db = await database;
  // Create db for save token session

  return runApp(List());
}

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigation();
  }
}
