import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list/screens/create.dart';
import 'package:list/screens/join.dart';
import 'package:list/style/theme.dart';

class ShareMenu extends StatefulWidget {
  const ShareMenu({Key? key}) : super(key: key);

  @override
  _ShareMenuState createState() => _ShareMenuState();
}

class _ShareMenuState extends State<ShareMenu> {
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
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          changePages(0);
                        },
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: morphOut.copyWith(
                            gradient: primaryOut,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text('Create a new list'),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(height: 4,
                      width: 300,
                      decoration: morphOut,),
                      SizedBox(height: 50),
                      InkWell(
                        onTap: () {
                          changePages(1);
                        },
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: morphOut.copyWith(
                            gradient: primaryOut,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text('Join Friend\'s list'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
