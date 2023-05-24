import 'package:flutter/material.dart';
import '../../../../../components/melon_input.dart';
import '../../../../../components/melon_button.dart';
import 'package:delivery_profile/app_types.dart';
import 'package:delivery_profile/language.dart';

class RegisterInfoScreen extends StatefulWidget {
  const RegisterInfoScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterInfoScreenState();
  }
}

class _RegisterInfoScreenState extends State<RegisterInfoScreen> {
  //**********************************************//
  final TextEditingController _ovogController = TextEditingController();
  final TextEditingController _nerController = TextEditingController();

  //**********************************************//
  String _ovogError;
  String _nerError;
  String _isGender = '';

  //**********************************************//
  @override
  void initState() {
    super.initState();
  }

  //**********************************************//
  @override
  void dispose() {
    super.dispose();
    _ovogController.dispose();
    _nerController.dispose();
  }

  //**********************************************//
  List<Widget> gender = <Widget>[
    const Text(Language.MALE_BTN,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
    const Text(Language.FEMALE_BTN,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700))
  ];

  //**********************************************//
  final List<bool> _selectedGender = <bool>[false, false];

  //**********************************************//
  bool vertical = false;

  //**********************************************//
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          int count = 0;
          Navigator.of(context).popUntil((_) => count++ >= 2);
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
                children: [_buildLogo(), _buildRegisterInfoSection()],
              ),
            ),
          ),
        ));
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
            Language.REG_CONF_INFO_LABEL,
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
  Widget _buildRegisterInfoSection() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: MelonInput(
            labelText: Language.LAST_NAME_FIELD,
            controller: _ovogController,
            type: TextInputType.name,
            errorText: _ovogError,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: MelonInput(
            labelText: Language.FIRST_NAME_FIELD,
            controller: _nerController,
            type: TextInputType.name,
            errorText: _nerError,
          ),
        ),
        ToggleButtons(
          direction: vertical ? Axis.vertical : Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < _selectedGender.length; i++) {
                _selectedGender[i] = i == index;
                if (_selectedGender[i] != true) {
                  setState(() {
                    _isGender = Language.MALE;
                  });
                } else {
                  setState(() {
                    _isGender = Language.FEMALE;
                  });
                }
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderColor: const Color(0xffE1E3E8),
          selectedBorderColor: const Color(0xffF1F2F4),
          selectedColor: Colors.white,
          fillColor: const Color(0xff2DC62D),
          color: Colors.black,
          constraints: const BoxConstraints(
            minHeight: 60.0,
            minWidth: 140.0,
          ),
          isSelected: _selectedGender,
          children: gender,
        ),
        const SizedBox(
          height: 40,
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
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppTypes.SCREEN_REGISTER_PHONE,
              );
            },
          ),
        ),
      ]),
    );
  }
}
