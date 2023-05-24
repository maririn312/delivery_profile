import 'package:flutter/material.dart';

class MelonNotifTile extends StatelessWidget {

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final Color color;
  final bool isRead;
  final GestureTapCallback onClick;

  const MelonNotifTile({
    Key key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.isRead = false,
    this.onClick,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> shadows = [];
    Color clr = color ?? Theme.of(context).colorScheme.secondary;

    if(isRead) {

    } else {
      shadows.add(BoxShadow(
          color: clr,
          blurRadius: 7,
          spreadRadius: 0
      ));
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: shadows,
          ),
          child: ListTile(
            visualDensity: VisualDensity.compact,
            leading: leading,
            title: title,
            subtitle: subtitle,
            trailing: trailing,
          ),
        ),
      ),
    );
  }

}