import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list/fetch_api/list.dart';
import 'package:list/model/list_model.dart';
import 'package:list/style/theme.dart';

typedef void ParentIntCallback(int id);


class ListWidget extends StatefulWidget {
  final ParentIntCallback id;

  const ListWidget({required this.id}) ;


  @override
  _ListWidgetState createState() => _ListWidgetState();
}



class _ListWidgetState extends State<ListWidget> {
  late Future<ListModel> futureList;


  @override
  final id = 
  void initState() {
    super.initState();
    futureList = fetchList(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: themeList.primaryColor,
      // child: Text(list.name),
      child: FutureBuilder<ListModel>(
        future: futureList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.name);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

