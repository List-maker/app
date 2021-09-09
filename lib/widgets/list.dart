import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list/model/list.dart';


Future<ListModel> fetchList() async {
  await Future.delayed(Duration(seconds: 2));

  String data = await rootBundle.loadString("assets/data/list_data.json");

  return ListModel.fromJson(jsonDecode(data));
}


class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  late Future<ListModel> futureList;


  @override
  void initState() {
    super.initState();
    futureList = fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.purple,
      // child: Text(list.name),
      child: FutureBuilder<ListModel>(
        future: futureList,
        builder: (context, snapshot) {
          List<Widget> children;
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
