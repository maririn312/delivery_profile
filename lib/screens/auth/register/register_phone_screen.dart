// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../components/melon_button.dart';
import 'package:delivery_profile/app_types.dart';
import 'package:animate_do/animate_do.dart';

import 'package:delivery_profile/language.dart';

class RegisterPhoneScreen extends StatefulWidget {
  const RegisterPhoneScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterPhoneScreenState();
  }
}

class _RegisterPhoneScreenState extends State<RegisterPhoneScreen> {
  //**********************************************//
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //**********************************************//
  final TextEditingController _phoneController = TextEditingController();
  String initialCountry = 'MN';

  //**********************************************//
  @override
  void initState() {
    super.initState();
  }

  //**********************************************//
  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
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
              children: [_buildLogo(), _buildRegisterPhoneSection()],
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
            child: const Text(Language.PHONE_FIELD,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35))),
        Container(
          margin: const EdgeInsets.only(right: 40, left: 40, top: 40),
          child: const Text(
            Language.PHONE_LABEL,
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
  Widget _buildRegisterPhoneSection() {
    String phone = '+976';

    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(children: [
        const SizedBox(height: 60),
        Container(
          height: 90,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: MelonButton(
            color: const Color(0xff0bab5c),
            child: const Center(
              child: Text(Language.SENT_CONF,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
            ),
            onPressed: () => {},
          ),
        ),
      ]),
    );
  }
}
