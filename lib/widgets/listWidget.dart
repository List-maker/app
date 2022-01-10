import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list/api/listCalls.dart';
import 'package:list/model/list_model.dart';
import 'package:list/style/IcList_icons.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/itemWidget.dart';
import 'package:list/widgets/morphOut.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key, required this.id, required this.remove})
      : super(key: key);
  final int id;
  final Function remove;

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late Future<ListModel> futureList;
  double height = 0;
  double initialHeight = 0;
  late ListModel list;
  late Map<String, Widget> items = {};

  delete() async {
    await deleteList(widget.id);
    widget.remove();
  }

  removeItem(int itemId) {
    list.items.remove(itemId);
    items.remove(itemId.toString());
    items.remove('00' + itemId.toString());
    setState(() {});
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
            MediaQuery.of(context).size.height * 0.7) {
      setState(() {
        height = details.globalPosition.dy - initialHeight;
      });
    } else if ((details.globalPosition.dy - initialHeight) < 0) {
      setState(() {
        height = 0;
      });
    } else if ((details.globalPosition.dy - initialHeight) >
        MediaQuery.of(context).size.height * 0.7) {
      setState(() {
        height = MediaQuery.of(context).size.height * 0.7;
      });
    }
  }

  @override
  void initState() {
    futureList = fetchList(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: FutureBuilder<ListModel>(
        future: futureList,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Text("Loading ...");
          }

          if (snapshot.hasError) {
            return Text("Error");
          }

          list = snapshot.data!;
          list.items.forEach((itemId) {
            items[itemId.toString()] = ItemWidget(
              key: ObjectKey(itemId),
              id: itemId,
              remove: () {
                removeItem(itemId);
              },
            );
            items['00' + itemId.toString()] = SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            );
          });

          return MorphOut(
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.2,
                maxHeight: MediaQuery.of(context).size.height * 0.7,
              ),
              height: MediaQuery.of(context).size.height * 0.2 + height,
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
                    child: ListView(
                      children: items.values.toList(),
                    ),
                  ),
                  Container(
                      child: GestureDetector(
                    onLongPressDown: (event) {
                      onLongPressDown(context, event);
                    },
                    onLongPressMoveUpdate: (event) {
                      onLongPressMoveUpdate(context, event);
                    },
                    child: Center(
                      child: Icon(
                        IcList.drag,
                        color: whiteText,
                      ),
                    ),
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
