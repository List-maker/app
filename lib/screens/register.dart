import 'package:flutter/material.dart';
import 'package:list/api/authCalls.dart';
import 'package:list/api/userCalls.dart';
import 'package:list/database/user_db.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/primaryButton.dart';
import 'package:list/widgets/safeScreen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        saveUser(await fetchUser());
        Navigator.pushNamed(context, '/hello');
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
    return SafeScreen(child: Column(
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

                        padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.05),
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
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width * 0.05),
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
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width * 0.05),
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
                    PrimaryButton(text: 'Register', onTap: (){
                      _onSubmit();
                    },)
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 10,
            ),
            Text('You already have an account? '),
            Spacer(),
            PrimaryButton(text: 'Login', onTap: (){
              Navigator.pushNamed(context, '/login');
            }),
            Spacer(),
          ],
        ),
    );
  }
}