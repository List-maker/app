import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list/api/listCalls.dart';
import 'package:list/model/list_model.dart';
import 'package:list/style/IcList_icons.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/itemWidget.dart';
import 'package:list/widgets/morphOut.dart';

Set<int> savedGlobal = new Set<int>();

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
  late List itemsList;

  delete() {
    //TODO:
  }

  removeItem(itemId) {
    savedGlobal.remove(itemId);
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
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: itemsList.length,
                      itemBuilder: (context, itemId) {
                        return ItemWidget(
                          id: itemsList.elementAt(itemId),
                          update: removeItem(itemId),
                        );
                      },
                    ),
                  ),
                ),
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
