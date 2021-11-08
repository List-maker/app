import 'package:flutter/material.dart';
import 'package:list/api/listCalls.dart';
import 'package:list/model/list_model.dart';
import 'package:list/style/List_icons.dart';
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
            child: Column(

              children: [
                Row(
                  children: [
                    Text(list.name),
                    Icon(IcList.remove),
                  ],
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.23,
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  child:
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: list.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      id: list.items.elementAt(index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    );
                  },
                ),
                ),
              ],
            ),
          );
        }

        return Text("DATA");
      },
    );
  }
}
