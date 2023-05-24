// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../components/melon_input.dart';
import '../../../../../components/melon_button.dart';
import 'package:delivery_profile/app_types.dart';

import '../../../language.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordScreenState();
  }
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  //**********************************************//
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  //**********************************************//
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
    _passwordController.dispose();
    _rePasswordController.dispose();
  }

  /* ================================================================================== */
  /* ================================================================================== */
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
              children: [_buildLogo(), _buildChangePasswordSection()],
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
            child: const Text(Language.NEW_PASSWORD,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35))),
        Container(
          margin: const EdgeInsets.only(right: 40, left: 40, top: 20),
          child: const Text(
            Language.CHANGE_PASS_LABEL,
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
  Widget _buildChangePasswordSection() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(children: [
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
            labelText: Language.RE_PASSWORD_LABEL,
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
              child: Text(Language.BTN_UPDATE_PASS,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
            ),
            onPressed: () => {},
          ),
        ),
      ]),
    );
  }
}
