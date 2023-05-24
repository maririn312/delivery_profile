import 'package:flutter/material.dart';

void alertView(context, {String title, String msg, void Function() callback}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            callback?.call();
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

class AlertDialogAction {
  final String text;
  final void Function() onPressed;

  AlertDialogAction({this.text, this.onPressed});

  Widget buildButton() {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

void promptView(
  BuildContext context,
  String title,
  String msg,
  List<AlertDialogAction> buttons, [
  String type = 'alert',
]) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: TextField(
        decoration: InputDecoration(
          hintText: msg,
        ),
      ),
      actions: buttons.map((button) => button.buildButton()).toList(),
    ),
  );
}
