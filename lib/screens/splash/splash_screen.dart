import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../app_types.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //**********************************************//
  @override
  void initState() {
    super.initState();
  }

  /* ================================================================================== */
  /* ================================================================================== */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/melon.json',
          fit: BoxFit.contain,
          onLoaded: (composition) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushNamed(context, AppTypes.SCREEN_LOGIN);
            });
          },
        ),
      ),
    );
  }
}
