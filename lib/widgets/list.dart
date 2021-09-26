import 'package:flutter/material.dart';
import 'package:list/fetch_api/list.dart';
import 'package:list/model/list_model.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/item.dart';

class ListWidget extends StatefulWidget {
  final int id;

  ListWidget({required this.id});

  @override
  _ListWidgetState createState() => _ListWidgetState(id);
}

class _ListWidgetState extends State<ListWidget> {
  late Future<ListModel> futureList;

  final int id;

  _ListWidgetState(this.id);

  @override
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
            return Column(children: [Text(snapshot.data!.name),
            ItemWidget(id: snapshot.data!.id)],);
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
