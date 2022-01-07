import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list/api/listCalls.dart';
import 'package:list/model/list_model.dart';
import 'package:list/style/IcList_icons.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/morphOut.dart';

import 'itemWidget.dart';

Set<int> itemSet = new Set<int>();

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
  double initialHeight = 0;

  delete() {
    //TODO:
  }

  removeItem(itemId) {
    print("herererwr!!!");
    setState(() {
      itemSet.remove(itemId);
    });
  }

  void onLongPressDown(BuildContext context, LongPressDownDetails details) {
    setState(() {
      initialHeight = details.globalPosition.dy - height;
    });
  }

  void onLongPressMoveUpdate(
      BuildContext context, LongPressMoveUpdateDetails details) {
    if ((details.globalPosition.dy - initialHeight) > 0 &&
        (details.globalPosition.dy - initialHeight) <
            MediaQuery.of(context).size.height * 0.5) {
      setState(() {
        height = details.globalPosition.dy - initialHeight;
      });
    } else if ((details.globalPosition.dy - initialHeight) < 0) {
      setState(() {
        height = 0;
      });
    } else if ((details.globalPosition.dy - initialHeight) >
        MediaQuery.of(context).size.height * 0.5) {
      setState(() {
        height = MediaQuery.of(context).size.height * 0.5;
      });
    }
  }

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
        if (snapshot.connectionState != ConnectionState.done) {
          return Text("Loading ...");
        }

        if (snapshot.hasError) {
          return Text("Error");
        }

        var list = snapshot.data!;

        list.items.forEach((element) {
          itemSet.add(element);
        });

        return MorphOut(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.26 + height,
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
                        style: TextStyle(color: primary),
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
                Expanded(child: TTest()),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.,
                  child: Row(children: [
                    Expanded(
                        child: GestureDetector(
                      onLongPressDown: (event) =>
                          onLongPressDown(context, event),
                      onLongPressMoveUpdate: (event) =>
                          onLongPressMoveUpdate(context, event),
                      child: Center(
                        child: Icon(
                          IcList.drag,
                          color: whiteText,
                        ),
                      ),
                    )),
                  ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class TTest extends StatefulWidget {
  const TTest({Key? key}) : super(key: key);

  @override
  _TTestState createState() => _TTestState();
}

class _TTestState extends State<TTest> {
  @override
  Widget build(BuildContext context) {
    Iterable<ItemWidget> items = itemSet.map((int itemId) {
      return ItemWidget(
        id: itemId,
        remove: () {
          setState(() {
            itemSet.remove(itemId);
          });
        },
      );
    });

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: items,
    ).toList();

    return Container(
      child: ListView(children: divided),
    );
  }
}
