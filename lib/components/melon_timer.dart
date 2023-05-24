// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';

class MelonTimer extends StatefulWidget {
  final int seconds;

  const MelonTimer({Key key, this.seconds}) : super(key: key);

  @override
  _MelonTimerState createState() => _MelonTimerState();
}

class _MelonTimerState extends State<MelonTimer> {
  Timer _timer;
  int _secondsRemaining = 0;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = (_secondsRemaining / 60).truncate();
    int seconds = _secondsRemaining - (minutes * 60);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${minutes.toString().padLeft(2, '0')}:',
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          seconds.toString().padLeft(2, '0'),
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
