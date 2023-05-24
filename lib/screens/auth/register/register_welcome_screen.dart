import 'package:flutter/material.dart';
import '../../../../../components/melon_button.dart';
import 'package:delivery_profile/app_types.dart';

import '../../../language.dart';

class RegisterWelcomeScreen extends StatefulWidget {
  const RegisterWelcomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterWelcomeScreenState();
  }
}

class _RegisterWelcomeScreenState extends State<RegisterWelcomeScreen> {
  //**********************************************//
  final TextEditingController _phoneController = TextEditingController();

  //**********************************************//

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
              children: [
                _buildLogo(),
                const SizedBox(
                  height: 20,
                ),
                _buildRegisterWelcomeSection()
              ],
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
            margin: const EdgeInsets.only(top: 70),
            color: Theme.of(context).colorScheme.surface,
            width: 800,
            child: Image.asset(
              'assets/images/aa.png',
              width: 280.0,
            )),
        Container(
            margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
            color: Theme.of(context).colorScheme.surface,
            width: 800,
            child: const Text(Language.CREATED_ACC,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))),
        Container(
          margin: const EdgeInsets.only(right: 40, left: 40, top: 20),
          child: const Text(
            Language.CREATED_ACC_LABEL,
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
  Widget _buildRegisterWelcomeSection() {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: MelonButton(
        color: const Color(0xff0bab5c),
        child: const Center(
          child: Text(Language.BTN_START,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
        ),
        onPressed: () => {Navigator.pushNamed(context, AppTypes.SCREEN_LOGIN)},
      ),
    );
  }
}
