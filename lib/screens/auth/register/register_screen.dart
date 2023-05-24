// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../components/melon_input.dart';
import '../../../../../components/melon_button.dart';
import 'package:delivery_profile/app_types.dart';

import 'package:delivery_profile/language.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  //**********************************************//
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  //**********************************************//
  String _unameError;
  String _passwordError;
  String _rePasswordError;

  //**********************************************//
  bool _passwordVisible;
  bool _rePasswordVisible;

  //**********************************************//
  @override
  void initState() {
    _passwordVisible = false;
    _rePasswordVisible = false;
    super.initState();
  }

  //**********************************************//
  @override
  void dispose() {
    super.dispose();
    _unameController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
  }

  //**********************************************//
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        int count = 0;
        Navigator.of(context).popUntil((_) => count++ >= 4);
        return true;
      },
      child: GestureDetector(
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
          ),
        ),
      ),
    );
  }

  /* ================================================================================== */
  /* ================================================================================== */
  Widget _buildLogo() {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 110, left: 40, right: 40),
            color: Theme.of(context).colorScheme.surface,
            width: 800,
            child: const Text(Language.CREATE_REG,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35))),
        Container(
          margin: const EdgeInsets.only(right: 40, left: 40, top: 20),
          child: const Text(
            Language.REGISTER_LABEL,
            style: TextStyle(
                color: Color(0xff606774),
                fontWeight: FontWeight.w300,
                fontSize: 16),
          ),
        ),
      ],
    );
  }

  /* ================================================================================== */
  /* ================================================================================== */
  Widget _buildLoginSection() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: MelonInput(
            labelText: Language.UNAME_FIELD,
            controller: _unameController,
            type: TextInputType.name,
            errorText: _unameError,
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
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: MelonInput(
            labelText: Language.RE_PASS,
            controller: _rePasswordController,
            obscureText: !_rePasswordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                  _rePasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xff9199A5)),
              onPressed: () {
                setState(() {
                  _rePasswordVisible = !_rePasswordVisible;
                });
              },
            ),
            type: TextInputType.text,
            errorText: _rePasswordError,
          ),
        ),
        Container(
          height: 90,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: MelonButton(
            color: const Color(0xff0bab5c),
            child: const Center(
              child: Text(Language.BTN_CONTINUE,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
            ),
            onPressed: () {},
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 5, left: 45, right: 45),
            child: Row(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5, right: 5),
                child: const Text(
                  Language.IS_REGISTERED,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppTypes.SCREEN_LOGIN);
                    },
                    child: const Text(Language.BTN_LOGIN,
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

  _valideForm() {
    if (_unameController.text.isNotEmpty) {
      setState(() {
        _unameError = null;
      });
      if (_passwordController.text.isNotEmpty) {
        setState(() {
          _passwordError = null;
        });

        if (_rePasswordController.text.isNotEmpty &&
            _rePasswordController.text == _passwordController.text) {
          setState(() {
            _rePasswordError = null;
          });

          return true;
        } else {
          setState(() {
            _rePasswordError = Language.ERROR_PIN2_RE;
          });
        }
        return true;
      } else {
        setState(() {
          _passwordError = Language.ERROR_PIN;
        });
      }
    } else {
      setState(() {
        _unameError = Language.ERROR_UNAME;
      });
    }
  }
}
