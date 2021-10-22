import 'package:flutter/material.dart';
import 'package:list/fetch_api/authCalls.dart';
import 'package:list/style/theme.dart';
import 'package:list/widgets/pageTitle.dart';
import 'package:list/widgets/primaryButton.dart';
import 'package:list/widgets/safeScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        Navigator.pushNamed(
          context,
          '/hello',
        );
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
    return SafeScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageTitle(title: 'Login'),
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
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
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
                            if (!_loginFormKey.currentState!.validate()) {
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
                    PrimaryButton(text: 'Login', onTap: _onSubmit)
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
          PrimaryButton(
            text: 'Register',
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
