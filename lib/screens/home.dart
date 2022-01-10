import 'package:flutter/material.dart';
import 'package:list/api/listCalls.dart';
import 'package:list/widgets/listWidget.dart';
import 'package:list/widgets/safeScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> futureListsId;
  late List<dynamic> listsIds;
  late Map<String, Widget> lists = {};

  removeList(int listId) {
    listsIds.remove(listId);
    lists.remove(listId.toString());
    lists.remove('00' + listId.toString());
    setState(() {});
  }

  @override
  void initState() {
    futureListsId = fetchListsId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeScreen(
      title: "Home",
      child: Center(
        child: FutureBuilder<List>(
            future: futureListsId,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Text("Loading ...");
              }

              if (snapshot.hasError) {
                return Text("Error");
              }

              listsIds = snapshot.data!;
              listsIds.forEach((listId) {
                lists[listId.toString()] = ListWidget(
                    key: ObjectKey(listId),
                    id: listId,
                    remove: () {
                      removeList(listId);
                    });
                lists['00' + listId.toString()] = SizedBox(
                  height: MediaQuery.of(context).size.height * 0.007,
                );
              });

              return Container(
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: lists.values.toList(),
                ),
              );
            }),
      ),
    );
  }
}
