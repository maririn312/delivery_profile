// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:melon_mobile_flutter/components/melon_loading_indicator.dart';
import 'package:melon_mobile_flutter/components/component_interfaces/melon_button_interface.dart';

class MelonButton extends MelonButtonInterface {
  const MelonButton({
    @required child,
    @required onPressed,
    color,
  }) : super(child: child, onPressed: onPressed, color: color);

  @override
  Widget build(BuildContext context) {
    Color clr = color ?? Theme.of(context).colorScheme.background;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isLoading ? color : clr,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: Center(
        child: isLoading
            ? SizedBox(
                child: MelonLoadingIndicator(),
              )
            : child,
      ),
    );
  }
}
