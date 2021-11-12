import 'package:flutter/material.dart';
import 'package:list/api/itemCalls.dart';
import 'package:list/model/item_model.dart';

import 'morphIn.dart';
import 'morphOut.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _ItemWidgetState createState() => _ItemWidgetState(id: id);
}

class _ItemWidgetState extends State<ItemWidget> {
  _ItemWidgetState({required this.id});

  late Future<ItemModel> futureItem;

  final int id;

  @override
  void initState() {
    futureItem = fetchItem(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemModel>(
      future: futureItem,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ItemModel item = snapshot.data!;
          if (item.checked) {
            return MorphIn(
              child: Text(item.name),
            );
          } else {
            return MorphOut(
              child: Text(item.name),
            );
          }
        }
        return Text("data");
      },
    );
  }
}
