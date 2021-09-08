import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list/screens/create.dart';
import 'package:list/screens/join.dart';

class NewList extends StatefulWidget {
  const NewList({Key? key}) : super(key: key);

  @override
  _NewListState createState() => _NewListState();
}

class _NewListState extends State<NewList> {
  int _indexOption = 2;

  void changePages(int index) {
    setState(() {
      _indexOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _indexOption != 2
        ? [Create(changePages), Join(changePages)].elementAt(_indexOption)
        : SafeArea(
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: Container(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          changePages(0);
                        },
                        child: Text('Create a new list'),
                      ),
                      SizedBox(height: 20),
                      Divider(),
                      SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {
                          changePages(1);
                        },
                        child: Text('Join Friend\'s list'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
