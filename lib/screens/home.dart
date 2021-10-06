import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list/fetch_api/listCalls.dart';
import 'package:list/widgets/list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<List> futureLists;


  @override
  void initState() {
    super.initState();
    futureLists = fetchLists();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      FutureBuilder<List>(
        future: futureLists,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListWidget(
                      id: snapshot.data!.elementAt(index));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.03,
                  );
                },
              ),
            );
          };
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
  }
