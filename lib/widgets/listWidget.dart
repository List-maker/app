import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list/api/listCalls.dart';
import 'package:list/model/list_model.dart';
import 'package:list/style/List_icons.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/itemWidget.dart';
import 'package:list/widgets/morphOut.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _ListWidgetState createState() => _ListWidgetState(id: id);
}

class _ListWidgetState extends State<ListWidget> {
  _ListWidgetState({required this.id});

  final int id;
  late Future<ListModel> futureList;

  double height = 0;

  delete() {
    deleteList(id);
  }

  void onTapDown(BuildContext context, TapDownDetails details) {}

  @override
  void initState() {
    futureList = fetchList(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ListModel>(
      future: futureList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var list = snapshot.data!;
          return MorphOut(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.26,
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Row(
                      children: [
                        Text(
                          list.name,
                          style: TextStyle(color: themeList.primaryColor),
                        ),
                        Spacer(),
                        InkWell(
                          child: Icon(
                            IcList.remove,
                            color: whiteText,
                          ),
                          onTap: () {
                            delete();
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: list.items.length,
                        itemBuilder: (context, index) {
                          return ItemWidget(
                            id: list.items.elementAt(index),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.,
                    color: Colors.red,
                    child: Row(children: [
                      Text(this.height.toString()),
                      Expanded(
                          child: InkWell(
                        child: Center(
                          child: Text('='),
                        ),
                      )),
                    ]),
                  )
                ],
              ),
            ),
          );
        }

        return Text("DATA");
      },
    );
  }
}
