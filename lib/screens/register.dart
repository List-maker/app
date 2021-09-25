import 'package:flutter/material.dart';
import 'package:list/fetch_api/auth.dart';
import 'package:list/navigation/navigation.dart';
import 'package:list/screens/helloPage.dart';
import 'package:list/screens/login.dart';
import 'package:list/style/theme.dart';

typedef ParentFunctionCallback = void Function(bool);

class RegisterNavigation extends StatefulWidget {
  const RegisterNavigation({Key? key}) : super(key: key);

  @override
  _RegisterNavigationState createState() => _RegisterNavigationState();
}

class _RegisterNavigationState extends State<RegisterNavigation> {
  late List<Widget> _pagesOptions;

  int _pageIndex = 0;

  void changePages(bool goToLogin) async {
    if (goToLogin) {
      _pagesOptions.add(LoginNavigation());
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
      RegisterPage(changePages),
      HelloPage(),
      Application(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeList.backgroundColor,
      body: IndexedStack(
        index: _pageIndex,
        children: _pagesOptions,
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage(this.changePage);

  final ParentFunctionCallback changePage;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _allFormKey = GlobalKey<FormState>();
  final _usernameFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  late FocusNode _usernameFocus;
  late FocusNode _emailFocus;
  late FocusNode _passwordFocus;
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  void _onSubmit() async {
    _passwordFocus.unfocus();

    if (_usernameFormKey.currentState!.validate() &&
        _emailFormKey.currentState!.validate() &&
        _passwordFormKey.currentState!.validate()) {
      bool areErrorWhenFetch = false;

      await fetchRegister(_username.text, _email.text, _password.text)
          .catchError((error) {
        areErrorWhenFetch = true;

        print(error);
      });

      if (!areErrorWhenFetch) {
        widget.changePage(false);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _usernameFocus = FocusNode();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _username.dispose();
    _email.dispose();
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
                'Register',
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
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width * 0.70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: _usernameFormKey,
                      child: Container(
                        decoration: morphOut,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          style: inputStyle,
                          decoration: inputDecoration.copyWith(
                            hintText: 'Enter your name',
                          ),
                          validator: (String? value) {
                            return (value != null && value.isEmpty)
                                ? 'Please enter name'
                                : null;
                          },
                          onFieldSubmitted: (String? value) {
                            if (!_usernameFormKey.currentState!.validate()) {
                              _usernameFocus.requestFocus();
                            } else {
                              _emailFocus.requestFocus();
                            }
                          },
                          autofillHints: [AutofillHints.username],
                          focusNode: _usernameFocus,
                          autofocus: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: _username,
                        ),
                      ),
                    ),
                    Spacer(),
                    Form(
                      key: _emailFormKey,
                      child: Container(
                        decoration: morphOut,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          style: inputStyle,
                          decoration: inputDecoration.copyWith(
                            hintText: 'Enter your email',
                          ),
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter email';
                            } else if (!(value!.contains('@') &&
                                value.contains('.'))) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                          onFieldSubmitted: (String? value) {
                            if (!_emailFormKey.currentState!.validate()) {
                              _emailFocus.requestFocus();
                            } else {
                              _passwordFocus.requestFocus();
                            }
                          },
                          autofillHints: [AutofillHints.email],
                          focusNode: _emailFocus,
                          autofocus: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: _email,
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
                            if (!_passwordFormKey.currentState!.validate()) {
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
                        child: Center(child: Text('Register')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 10,
            ),
            Text('You already have an account? '),
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
                  child: Text('Login'),
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
