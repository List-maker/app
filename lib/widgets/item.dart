import 'package:flutter/material.dart';
import 'package:list/fetch_api/item.dart';
import 'package:list/model/item_model.dart';
import 'package:list/style/theme.dart';

class ItemWidget extends StatefulWidget {
  final int id;

  ItemWidget({required this.id});

  @override
  _ItemWidgetState createState() => _ItemWidgetState(id);
}

class _ItemWidgetState extends State<ItemWidget> {
  late Future<ItemModel> futureItem;

  final int id;

  _ItemWidgetState(this.id);

  @override
  void initState() {
    super.initState();
    futureItem = fetchItem(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: themeList.backgroundColor,
      // child: Text(list.name),
      child: FutureBuilder<ItemModel>(
        future: futureItem,
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
