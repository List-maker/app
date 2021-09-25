import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:list/fetch_api/auth.dart';
import 'package:list/navigation/navigation.dart';
import 'package:list/screens/helloPage.dart';
import 'package:list/screens/register.dart';
import 'package:list/style/theme.dart';

typedef ParentFunctionCallback = void Function(bool);

class LoginNavigation extends StatefulWidget {
  const LoginNavigation({Key? key}) : super(key: key);

  @override
  _LoginNavigationState createState() => _LoginNavigationState();
}

class _LoginNavigationState extends State<LoginNavigation> {
  late List<Widget> _pagesOptions;

  int _pageIndex = 0;

  void changePages() async {

      setState(() {
        _pageIndex = 1;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        _pageIndex = 2;
      });

  }
  void goTorRegister() async {
    _pagesOptions.add(RegisterNavigation());
      setState(() {
        _pageIndex = 3;
      });


  }
  void changePages(bool goToRegister) async {
    if (goToRegister){
      _pagesOptions.add(RegisterNavigation());
      setState(() {
        _pageIndex = 3;
      });
    } else {
      setState(() {
        _pageIndex = 1;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        _pageIndex = 2;
      });
    }
  }


  @override
  void initState() {
    _pagesOptions = <Widget>[
      LoginPage(
        changePages,
        goTorRegister
      ),
      LoginPage(changePages),
      HelloPage(),
      Application(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeList.backgroundColor,
        body: IndexedStack(
          index: _pageIndex,
          children: _pagesOptions,
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage(this.changePage);

  final ParentFunctionCallback changePage;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _allFormKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  late FocusNode _loginFocus;
  late FocusNode _passwordFocus;
  final _login = TextEditingController();
  final _password = TextEditingController();

  void _onSubmit() async {
    _passwordFocus.unfocus();

    if (_loginFormKey.currentState!.validate() &&
        _passwordFormKey.currentState!.validate()) {
      bool areErrorWhenFetch = false;

      await fetchLogin(_login.text, _password.text).catchError((error) {
        areErrorWhenFetch = true;

        print(error);
      });

      if (!areErrorWhenFetch) {
        widget.changePage(false);
      }
    } else {
      _passwordFormKey.currentState!.validate();
    }
  }

  @override
  void initState() {
    super.initState();

    _loginFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _loginFocus.dispose();
    _passwordFocus.dispose();
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 28,
                  color: themeList.primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Form(
              key: _allFormKey,
              child: AutofillGroup(
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _loginFormKey,
                        child: Container(
                          decoration: morphOut,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            style: inputStyle,
                            decoration: inputDecoration.copyWith(
                              hintText: 'Enter your name or email',
                            ),
                            validator: (String? value) {
                              return (value != null && value.isEmpty)
                                  ? 'Please enter name or email'
                                  : null;
                            },
                            onFieldSubmitted: (String? value) {
                              if (value != null && value.isEmpty) {
                                _loginFormKey.currentState!.validate();
                                _loginFocus.requestFocus();
                              } else {
                                _passwordFocus.requestFocus();
                              }
                            },
                            autofillHints: [AutofillHints.username],
                            focusNode: _loginFocus,
                            autofocus: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _login,
                          ),
                        ),
                      ),
                      Spacer(),
                      Form(
                        key: _passwordFormKey,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: morphOut,
                          child: TextFormField(
                            style: inputStyle,
                            decoration: inputDecoration.copyWith(
                              hintText: 'Enter your password',
                            ),
                            validator: (String? value) {
                              return (value != null && value.isEmpty)
                                  ? 'Please enter your password'
                                  : null;
                            },
                            onFieldSubmitted: (String? value) {
                              if (value != null && value.isEmpty) {
                                _passwordFormKey.currentState!.validate();
                                _passwordFocus.requestFocus();
                              } else {
                                _onSubmit();
                              }
                            },
                            autofillHints: [AutofillHints.password],
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            focusNode: _passwordFocus,
                            controller: _password,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      InkWell(
                        onTap: () {
                          _onSubmit();
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: morphOut.copyWith(
                            gradient: primaryOut,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(child: Text('Login')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 10,
            ),
            Text('Don\'t have an account ?'),
            Spacer(),
            InkWell(
              onTap: () {
                widget.changePage(true);
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: morphOut.copyWith(
                  gradient: primaryOut,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text('Register'),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
