// ignore_for_file: depend_on_referenced_packages, unused_import, unused_local_variable, avoid_print

import 'dart:io';

import 'package:delivery_profile/app_theme.dart';
import 'package:delivery_profile/exceptions/exceptions_manager.dart';
import 'package:delivery_profile/screens/splash/splash_screen.dart';
import 'package:delivery_profile/screens/auth/forget/forget_password_screen.dart';
import 'package:delivery_profile/screens/auth/login/login_screen.dart';
import 'package:delivery_profile/screens/auth/register/register_screen.dart';
import 'package:delivery_profile/screens/auth/register/register_info_screen.dart';
import 'package:delivery_profile/screens/auth/register/register_phone_screen.dart';
import 'package:delivery_profile/screens/auth/register/register_otp_screen.dart';
import 'package:delivery_profile/screens/auth/register/register_welcome_screen.dart';
import 'package:delivery_profile/screens/auth/forget/forget_password_otp_screen.dart';
import 'package:delivery_profile/screens/auth/forget/change_password_screen.dart';
import 'package:delivery_profile/screens/auth/forget/forget_password_welcome_screen.dart';

import 'app_types.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

/// ============================================================= ///
class MelonBlocObserver extends BlocObserver {
  Logger logger = Logger(printer: PrettyPrinter(methodCount: 0));
  Logger errorLogger = Logger();

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    logger.i(event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.v(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    errorLogger.e(error, stackTrace);
  }
}

/// ============================================================= ///
class MelonHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

/// ============================================================= ///
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  /// ===================== APP PRE SETUPS ======================== ///
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MelonHttpOverrides();
  Bloc.observer = MelonBlocObserver();
  ExceptionManager.xMan.debugMode = true;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MelonApp());
}

class MelonApp extends StatelessWidget {
  const MelonApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: MaterialApp(
            title: 'Melon Social Networking  Mobile Application',
            theme: AppTheme.themeData,
            home: const SplashScreen(),
            debugShowCheckedModeBanner: true,
            navigatorObservers: [
              routeObserver
            ],
            routes: {
              AppTypes.SCREEN_LOGIN: (context) => const LoginScreen(),
              AppTypes.SCREEN_REGISTER: (context) => const RegisterScreen(),
              AppTypes.SCREEN_REGISTER_INFO: (context) =>
                  const RegisterInfoScreen(),
              AppTypes.SCREEN_REGISTER_PHONE: (context) =>
                  const RegisterPhoneScreen(),
              AppTypes.SCREEN_REGISTER_OTP: (context) =>
                  const RegisterOtpScreen(),
              AppTypes.SCREEN_REGISTER_WELCOME: (context) =>
                  const RegisterWelcomeScreen(),
              AppTypes.SCREEN_FORGET: (context) => const ForgetPasswordScreen(),
              AppTypes.SCREEN_FORGET_OTP: (context) =>
                  const ForgetPasswordOtpScreen(),
              AppTypes.SCREEN_FORGET_CHANGE: (context) =>
                  const ChangePasswordScreen(),
              AppTypes.SCREEN_FORGET_WELCOME: (context) =>
                  const ForgetPasswordWelcomeScreen(),
            }));
  }
}
