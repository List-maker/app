import 'package:flutter/material.dart';
import 'package:list/screens/home.dart';
import 'package:list/screens/profile.dart';
import 'package:list/screens/share_menu.dart';
import 'package:list/style/ListIcons.dart';
import 'package:list/style/theme.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedPageIndex = 0;

  static const List<Widget> _pagesOptions = <Widget>[
    Home(),
    ShareMenu(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeList.backgroundColor,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedPageIndex,
          children: _pagesOptions,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.035,
              0,
              MediaQuery.of(context).size.width * 0.035,
              10),
          child: Container(
            height: 55,
            width: 10,
            decoration: morphOut,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                InkWell(
                  child: Container(
                    decoration: _selectedPageIndex == 0
                        ? morphOut.copyWith(
                            borderRadius: BorderRadius.circular(15),
                            gradient: primaryOut,
                          )
                        : morphOut.copyWith(
                            borderRadius: BorderRadius.circular(15),
                          ),
                    height: 30,
                    width: 30,
                    child: Icon(
                      ListIcons.home,
                      color: _selectedPageIndex == 0
                          ? whiteText
                          : themeList.primaryColor,
                      size: 18,
                    ),
                  ),
                  onTap: () => _onItemTapped(0),
                ),
                Spacer(
                  flex: 2,
                ),
                InkWell(
                  child: Container(
                    decoration: _selectedPageIndex == 1
                        ? morphOut.copyWith(
                            borderRadius: BorderRadius.circular(15),
                            gradient: primaryOut,
                          )
                        : morphOut.copyWith(
                            borderRadius: BorderRadius.circular(15),
                          ),
                    height: 30,
                    width: 30,
                    child: Padding(
                      padding: EdgeInsets.only(right: 2),
                      child: Icon(
                        ListIcons.share,
                        color: _selectedPageIndex == 1
                            ? whiteText
                            : themeList.primaryColor,
                        size: 18,
                      ),
                    ),
                  ),
                  onTap: () => _onItemTapped(1),
                ),
                Spacer(
                  flex: 2,
                ),
                InkWell(
                  child: Container(
                    decoration: _selectedPageIndex == 2
                        ? morphOut.copyWith(
                            borderRadius: BorderRadius.circular(15),
                            gradient: primaryOut,
                          )
                        : morphOut.copyWith(
                            borderRadius: BorderRadius.circular(15),
                          ),
                    height: 30,
                    width: 30,
                    child: Icon(
                      ListIcons.person,
                      color: _selectedPageIndex == 2
                          ? whiteText
                          : themeList.primaryColor,
                      size: 18,
                    ),
                  ),
                  onTap: () => _onItemTapped(2),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
