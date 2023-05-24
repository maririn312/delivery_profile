import 'package:flutter/material.dart';

abstract class MelonButtonInterface extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final ShapeBorder shape;
  final bool isLoading;
  final Color color;

  const MelonButtonInterface({
    Key key,
    this.child,
    this.onPressed,
    this.shape,
    this.isLoading = false,
    this.color,
  }) : super(key: key);
}
