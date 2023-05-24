// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../components/melon_button.dart';
import 'package:delivery_profile/language.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:delivery_profile/app_types.dart';

class RegisterOtpScreen extends StatefulWidget {
  const RegisterOtpScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterOtpScreenState();
  }
}

class _RegisterOtpScreenState extends State<RegisterOtpScreen> {
  //**********************************************//
  final TextEditingController _tanController = TextEditingController();

  //**********************************************//
  int endTime = DateTime.now().millisecondsSinceEpoch + 10000 * 30;

  //**********************************************//
  @override
  void initState() {
    super.initState();
  }

  //**********************************************//
  @override
  void dispose() {
    super.dispose();
  }

  //**********************************************//
  void onEnd() {
    if (kDebugMode) {
      print('onEnd');
    }
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
              children: [_buildLogo(), _buildRegisterOtpSection()],
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
            child: const Text(Language.REG_CONF,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24))),
        Container(
          margin: const EdgeInsets.only(right: 40, left: 40, top: 20),
          child: const Text(
            Language.REG_CONF_LABEL,
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
  Widget _buildRegisterOtpSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildTanField(),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                Language.RE_TAN,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        Container(
          height: 90,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: MelonButton(
            color: const Color(0xff0bab5c),
            child: const Center(
              child: Text(Language.BTN_CONF,
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

  // ===================================================================== //
  Widget _buildTanField() {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      textStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onSurface),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        borderWidth: 1,
        inactiveColor: const Color(0xff2dc62d),
        inactiveFillColor: Colors.white,
        activeFillColor: const Color(0xff2dc62d),
        activeColor: Colors.white,
        selectedColor: const Color(0xff2dc62d),
        selectedFillColor: const Color(0xff2dc62d),
        fieldHeight: 62,
        fieldWidth: 62,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: _tanController,
      onCompleted: (v) {
        FocusScope.of(context).unfocus();
      },
      onChanged: (value) {
        if (kDebugMode) {
          print(value);
        }
      },
      beforeTextPaste: (text) {
        if (kDebugMode) {
          print("Allowing to paste $text");
        }
        return true;
      },
      appContext: context,
    );
  }
}
