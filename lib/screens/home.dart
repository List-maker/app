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

  test() async{

    print( fetchListsId());
  }

  @override
  void initState() {
    futureListsId = fetchListsId();
    test();
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
            if (snapshot.hasData) {
              return Center(
                child: ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListWidget(id: snapshot.data!.elementAt(index));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    );
                  },
                ),
              );
            }
            return Text("data");
          },
        ),
      ),
    );
  }
}
