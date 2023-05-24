// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../../components/component_interfaces/melon_loading_indicator_interface.dart';

class MelonLoadingIndicator extends MelonLoadingIndicatorInterface {
  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        strokeWidth: size,
      );
}
