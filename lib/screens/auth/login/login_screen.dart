// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../components/melon_input.dart';
import '../../../../../components/melon_button.dart';
import 'package:delivery_profile/app_types.dart';
import 'package:delivery_profile/language.dart';
import 'package:delivery_profile/utils/melon_utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  //**********************************************//
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //**********************************************//
  String _userError;
  String _passwordError;
  bool _passwordVisible;
  bool _rememberMe = false;

  //**********************************************//
  @override
  void initState() {
    _passwordVisible = false;
    _loadSavedCredentials();
    super.initState();
  }

  //**********************************************//
  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _passwordController.dispose();
  }

  /* ================================================================================== */
  /* ================================================================================== */
  Future<void> _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedUserName = prefs.getString('user name');
    String savedPassword = prefs.getString('password');
    bool savedRememberMe = prefs.getBool('rememberMe') ?? false;
    setState(() {
      _userController.text = savedUserName ?? '';
      _passwordController.text = savedPassword ?? '';
      _rememberMe = savedRememberMe;
    });
  }

  /* ================================================================================== */
  /* ================================================================================== */
  Future<void> _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_rememberMe) {
      await prefs.setString('user name', _userController.text);
      await prefs.setString('password', _passwordController.text);
    } else {
      await prefs.remove('user name');
      await prefs.remove('password');
    }
    await prefs.setBool('rememberMe', _rememberMe);
  }

  //**********************************************//
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            child: Column(
              children: [_buildLogo(), _buildLoginSection()],
            ),
          )),
    );
  }

  /* ================================================================================== */
  /* ================================================================================== */
  Widget _buildLogo() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppTypes.SCREEN_GUEST_DASHBOARD);
          },
          child: Container(
              margin: const EdgeInsets.only(top: 110),
              color: Theme.of(context).colorScheme.surface,
              width: 800,
              child: Image.asset(
                'assets/images/logo.png',
                width: 280.0,
              )),
        ),
        const Text(
          Language.LOGIN_LABEL,
          style: TextStyle(
              color: Color(0xff606774),
              fontWeight: FontWeight.w300,
              fontSize: 16),
        ),
      ],
    );
  }

  /* ================================================================================== */
  /* ================================================================================== */
  Widget _buildLoginSection() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: MelonInput(
            labelText: Language.UNAME_FIELD,
            controller: _userController,
            type: TextInputType.name,
            errorText: _userError,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: MelonInput(
            labelText: Language.PASS_FIELD,
            controller: _passwordController,
            obscureText: !_passwordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xff9199A5)),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            type: TextInputType.text,
            errorText: _passwordError,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Checkbox(
                  activeColor: const Color(0xff14b450),
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value;
                    });
                  }),
              const Text(
                Language.REMEMBER_ME,
                style: TextStyle(
                    color: Color(0xff606774),
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
              ),
              const Spacer(
                flex: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppTypes.SCREEN_FORGET);
                },
                child: const Text(
                  Language.BTN_FORGET,
                  style: TextStyle(
                    color: Color(0xff14b450),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 90,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: MelonButton(
                color: const Color(0xff0bab5c),
                child: const Center(
                  child: Text(Language.BTN_LOGIN,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                onPressed: () async => {_saveCredentials()})),
        Container(
            margin: const EdgeInsets.only(top: 5, left: 45, right: 45),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: const Text(
                  Language.IS_REGISTERED,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppTypes.SCREEN_REGISTER);
                    },
                    child: const Text(Language.BTN_REG,
                        style: TextStyle(
                          color: Color(0xff14b450),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ))),
              ),
            ])),
      ]),
    );
  }

  /* ================================================================================== */
  /* ================================================================================== */
  bool _validateForm() {
    if (_userController.text.length != null) {
      setState(() {
        _userError = null;
      });
      if (MelonUtility.isNumeric(_passwordController.text) &&
          _passwordController.text.length != null) {
        setState(() {
          _passwordError = null;
        });
        return true;
      } else {
        setState(() {
          _passwordError = Language.ERROR_PIN;
        });
      }
    } else {
      setState(() {
        _userError = Language.ERROR_NAME;
      });
    }
    return false;
  }
}
