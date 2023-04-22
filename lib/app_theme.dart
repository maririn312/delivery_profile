// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
        fontFamily: 'Rubik',
        canvasColor: const Color(0xffefeff4),
        colorScheme: const ColorScheme.light(
          background: Color(0xffefeff4),
          primary: Color(0xff29b258),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      );

  static const Map<String, String> COLORS = {
    'PRIMARY': '#29b258',
    'PRIMARY_LIGHT': '#5FCE3D',
    'PRIMARY_DARK': '#059033',
    'MAIN_BG_WHITE': 'whitesmoke',
    'MAIN_GREY': '#A9B0BB',
    'TEXT_GREY': '#424852',
    'PH_GREY': '#606060',
    'DARK_GREY': '#1A1C22',
    'BLACK': '#000000',
    'WHITE': '#ffffff',
    'TRANSPARENT': 'rgba(0, 0, 0, 0)',
    'PRIMARY_ORANGE': '#FDC232',
    'PRIMARY_RED': '#ff0000',
    'PRIMARY_PINK': '#EF4D89',
    'PRIMARY_GREEN': '#5CDB5C',
    'BLACK70': 'rgba(0, 0, 0, 0.7)',
    'NOTIFICATION_BG_SEEN': '#FFFFFF54',
    'NOTIFICATION_BG_UNSEEN': '#079BAB54',
  };
}
