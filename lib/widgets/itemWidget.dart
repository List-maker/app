import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:list/api/itemCalls.dart';
import 'package:list/model/item_model.dart';
import 'package:list/style/IcList_icons.dart';
import 'package:list/style/theme.dart';

import 'morphIn.dart';
import 'morphOut.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key, required this.id, required this.update})
      : super(key: key);
  final int id;
  final Function update;

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late Future<ItemModel> futureItem;
  late bool isCheck;

  bool toggleDelete = false;
  double swipeWidth = 0;
  double initialSwipeWidth = 0;

  onLongPressDown(BuildContext context, LongPressDownDetails details) {
    setState(() {
      initialSwipeWidth = details.globalPosition.dx - swipeWidth;
    });
  }

  onLongPressMoveUpdate(
      BuildContext context, LongPressMoveUpdateDetails details) {
    if ((initialSwipeWidth - details.globalPosition.dx) > 0 &&
        (initialSwipeWidth - details.globalPosition.dx) <
            MediaQuery.of(context).size.width * 0.14) {
      setState(() {
        swipeWidth = initialSwipeWidth - details.globalPosition.dx;
      });
      if (swipeWidth > MediaQuery.of(context).size.width * 0.10) {
        setState(() {
          toggleDelete = true;
        });
      } else {
        setState(() {
          toggleDelete = false;
        });
      }
    } else if ((initialSwipeWidth - details.globalPosition.dx) < 0) {
      setState(() {
        swipeWidth = 0;
      });
    } else if ((initialSwipeWidth - details.globalPosition.dx) >
        MediaQuery.of(context).size.width * 0.14) {
      setState(() {
        toggleDelete = true;
        swipeWidth = MediaQuery.of(context).size.width * 0.14;
      });
    }
  }

  delete() async {
    await deleteItem(widget.id);
    widget.update();
  }

  onLongPressUp() {
    if (toggleDelete) {
      delete();
    } else {
      setState(() {
        swipeWidth = 0;
      });
    }
  }

  check() async {
    setState(() {
      isCheck = !isCheck;
    });

    await checkItem(widget.id);

    setState(() {
      futureItem = fetchItem(widget.id);
    });
  }

  _change(String? name) async {
    name ?? '';
    updateItem(widget.id, name!);
  }

  @override
  void initState() {
    futureItem = fetchItem(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.008,
      ),
      child: FutureBuilder<ItemModel>(
        future: futureItem,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            Text("Loading ... ");
          }
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.hasData) {
            ItemModel item = snapshot.data!;
            isCheck = item.checked;
            if (isCheck) {
              return Stack(children: [
                MorphIn(
                  decoration1Override: morphIn1.copyWith(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7)),
                  ),
                  decoration2Override: morphIn2.copyWith(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: inputDecoration,
                          initialValue: item.name,
                          style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                          onChanged: (String? text) {
                            _change(text);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Icon(
                            IcList.check_checked,
                            color: primary,
                          ),
                          onTap: () {
                            check();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onLongPressDown: (event) => onLongPressDown(context, event),
                    onLongPressMoveUpdate: (event) =>
                        onLongPressMoveUpdate(context, event),
                    onLongPressUp: () => onLongPressUp(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomRight: Radius.circular(7)),
                      ),
                      width:
                          MediaQuery.of(context).size.width * 0.02 + swipeWidth,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: toggleDelete
                          ? Center(
                              child: Icon(
                                IcList.remove,
                                // size: 15,
                                color: Colors.white,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ]);
            } else {
              return MorphOut(
                decorationOverride:
                    morphOut.copyWith(borderRadius: BorderRadius.circular(7)),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: inputDecoration,
                            initialValue: item.name,
                            style: TextStyle(
                                color: whiteText,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                            onChanged: (String? text) {
                              _change(text);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Icon(
                              IcList.check_no_checked,
                              color: whiteText,
                            ),
                            onTap: () {
                              check();
                            },
                          ),
                        ),
                      ],
                    )),
              );
            }
          }
          return Text("Loading ...");
        },
      ),
    );
  }
}
