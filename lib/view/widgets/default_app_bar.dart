import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key,  this.elevation, this.backgroundColor, this.title, this.actions, this.centerTitle, this.leading}) : super(key: key);
  final double? elevation;
  final Color? backgroundColor;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      leading:leading ,
    );
  }
}
