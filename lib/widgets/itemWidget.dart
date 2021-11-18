import 'package:flutter/material.dart';
import 'package:list/api/itemCalls.dart';
import 'package:list/model/item_model.dart';
import 'package:list/style/List_icons.dart';
import 'package:list/style/theme.dart';

import 'morphIn.dart';
import 'morphOut.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _ItemWidgetState createState() => _ItemWidgetState(id: id);
}

class _ItemWidgetState extends State<ItemWidget> {
  _ItemWidgetState({required this.id});

  late Future<ItemModel> futureItem;
  late bool isCheck;
  final int id;

  check() async {
    setState(() {
      isCheck = !isCheck;
    });

    await checkItem(id);

    setState(() {
      futureItem = fetchItem(id);
    });
  }
  _change(String? name) async{
    name?? '';
    updateItem(id, name!);
  }

  @override
  void initState() {
    futureItem = fetchItem(id);

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
          if (snapshot.hasData) {
            ItemModel item = snapshot.data!;
            isCheck = item.checked;
            if (item.checked) {
              return MorphIn(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: inputDecoration,
                        initialValue: item.name,
                        style: TextStyle(
                            color: isCheck ? themeList.primaryColor : whiteText,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                        onChanged: (String? text){
                          _change(text);
                        },
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Icon(
                        isCheck
                            ? IcList.check_checked
                            : IcList.check_no_checked,
                        color: isCheck ? themeList.primaryColor : whiteText,
                      ),
                      onTap: () {
                        check();
                      },
                    ),
                  ],
                ),
              );
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
                                color: isCheck
                                    ? themeList.primaryColor
                                    : whiteText,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          child: Icon(
                            item.checked
                                ? IcList.check_checked
                                : IcList.check_no_checked,
                            color: whiteText,
                          ),
                          onTap: () {
                            check();
                          },
                        ),
                      ],
                    )),
              );
            }
          }
          return Text("data");
        },
      ),
    );
  }
}
