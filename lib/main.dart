// ignore_for_file: depend_on_referenced_packages, unused_import, unused_local_variable, avoid_print

import 'dart:io';

import 'package:delivery_profile/app_theme.dart';
import 'package:delivery_profile/screens/home_screen.dart';

import 'app_types.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'exceptions/exceptions_manager.dart';

/// ============================================================= ///
class DeliveryBlocObserver extends BlocObserver {
  Logger logger = Logger(printer: PrettyPrinter(methodCount: 0));
  Logger errorLogger = Logger();

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
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  /// ===================== APP PRE SETUPS ======================== ///
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = DeliveryBlocObserver();
  ExceptionManager.xMan.debugMode = true;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: MaterialApp(
            title: 'Home Delivery',
            theme: AppTheme.themeData,
            // home: const RequestCallScreen(),
            // home: const InComingCallScreen(),
            home: const HomeScreen(
              title: 'fdfdsfasd',
            ),
            debugShowCheckedModeBanner: true,
            navigatorObservers: [
              routeObserver
            ],
            routes: {
              AppTypes.SCREEN_HOME: (context) =>
                  const HomeScreen(title: 'gfdgfsd'),
            }));
  }
}
