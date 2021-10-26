import 'package:flutter/material.dart';
import 'package:list/model/token_model.dart';
import 'package:list/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> saveUser(UserModel user) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
  );

  final db = await database;

  await db.insert(
    'user',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<UserModel> getUser() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
  );

  final db = await database;

  final Map<String, dynamic> map = (await db.query('user'))[0];

  return UserModel(
    id: map['id'],
    username: map['username'],
    email: map['email'],
    pinnedLists: map['pinned_lists'],
    settings: map['settings'],
  );
}

Future<void> deleteUser() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
  );

  final db = await database;


  await db.update(
    'user',
    UserModel(id: 1, username: 'null', email: 'null', pinnedLists: [], settings: 'null').toMap(),
    where: 'id = 1',
  );
}