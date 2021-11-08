import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key,required this.id}) : super(key: key);
  final int id;

  @override
  _ItemWidgetState createState() => _ItemWidgetState(id : id);
}

class _ItemWidgetState extends State<ItemWidget> {
  _ItemWidgetState({required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Text(id.toString());
  }
}
