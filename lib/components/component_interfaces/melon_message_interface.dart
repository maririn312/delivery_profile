import 'package:flutter/material.dart';

enum MelonMessageType { success, warning, error }

abstract class MelonMessageInterface extends StatelessWidget {
  final MelonMessageType type;
  final String message;
  final Icon icon;
  final Color textColor;
  final Color backgroundColor;

  const MelonMessageInterface(
      {Key key,
      this.type,
      this.message,
      this.icon,
      this.textColor,
      this.backgroundColor})
      : super(key: key);
}
