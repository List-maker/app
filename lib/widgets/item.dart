import 'package:flutter/material.dart';
import 'package:list/fetch_api/item.dart';
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

  @override
  void initState() {
    super.initState();
    futureItem = fetchItem(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      // width:  MediaQuery.of(context).size.width * 0.1,
      width: 15,
      decoration: morphOut,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder<ItemModel>(
        future: futureItem,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: [
                Text(snapshot.data!.name),
                Spacer(),
                InkWell(
                  onTap: null,
                  child: Icon(
                    snapshot.data!.checked
                        ? ListIcons.check
                        : ListIcons.no_check,
                    color: whiteText,
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
