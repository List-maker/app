import 'package:flutter/material.dart';
import 'package:list/fetch_api/itemCalls.dart';
import 'package:list/model/item_model.dart';
import 'package:list/style/ListIcons.dart';
import 'package:list/style/theme.dart';

class ItemWidget extends StatefulWidget {
  final int id;

  ItemWidget({required this.id});

  @override
  _ItemWidgetState createState() => _ItemWidgetState(id);
}

class _ItemWidgetState extends State<ItemWidget> {
  late Future<ItemModel> futureItem;

  final int id;

  _ItemWidgetState(this.id);

  checkItem(int id) async {
    await fetchCheckItem(id);

    setState(() {
      futureItem = fetchCreateItem(id);
    });
  }

  @override
  void initState() {
    super.initState();
    futureItem = fetchCreateItem(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemModel>(
      future: futureItem,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: 15,
            decoration: (snapshot.data!.checked ? morphIn : morphOut)
                .copyWith(borderRadius: BorderRadius.circular(7)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  snapshot.data!.name,
                  style: TextStyle(
                    fontSize: 18,
                    color: snapshot.data!.checked ? primary : whiteText,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    checkItem(snapshot.data!.id);
                  },
                  // onTap: null,
                  child: Icon(
                    snapshot.data!.checked
                        ? ListIcons.check
                        : ListIcons.no_check,
                    color: snapshot.data!.checked ? primary : whiteText,
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
