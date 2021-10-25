import 'package:flutter/material.dart';
import 'package:list/fetch_api/listCalls.dart';
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
      decoration: morphOut,
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.05,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.4,
      child: FutureBuilder<ListModel>(
        future: futureList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.data!.name),
                Spacer(),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.23,
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  // padding: const EdgeInsets.all(8),
                  child: ListView.separated(
                    itemCount: snapshot.data!.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemWidget(
                          id: snapshot.data!.items.elementAt(index));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                      );
                    },
                  ),
                ),
                Spacer(),
                ItemWidget(id: 2)
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}