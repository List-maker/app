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
      width: 200,
      height: 300,
      color: themeList.primaryColor,
      child: FutureBuilder<ListModel>(
        future: futureList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Text(snapshot.data!.name),
                Container(
                  constraints: BoxConstraints(maxHeight: 250),
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                      itemCount: snapshot.data!.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemWidget(
                            id: snapshot.data!.items.elementAt(index));
                      }),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
