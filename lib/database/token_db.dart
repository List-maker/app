import 'package:flutter/material.dart';
import 'package:list/model/token_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> saveToken(TokenModel token) async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
  );

  final db = await database;

  await db.insert(
    'token',
    token.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<TokenModel> getToken() async {

  try {
    final database = openDatabase(
      join(await getDatabasesPath(), 'database.db'),
    );

    final db = await database;

    final Map<String, dynamic> map = (await db.query('token'))[0];

    return TokenModel(
      refreshToken: map['refresh_token'],
      accessToken: map['access_token'],
    );
  } catch (error){
    return TokenModel(
      refreshToken: '',
      accessToken: '',
    );
  }
}

Future<void> deleteToken() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
  );

  final db = await database;


  await db.update(
    'token',
    TokenModel(accessToken: 'null', refreshToken: 'null').toMap(),
    where: 'id = 1',
  );
}
