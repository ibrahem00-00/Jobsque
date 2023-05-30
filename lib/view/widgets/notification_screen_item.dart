import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_strings.dart';
import 'default_text.dart';

class NotificationScreenItem extends StatefulWidget {
  NotificationScreenItem({Key? key, required this.txt}) : super(key: key);
  String txt;
  bool value = false;

  @override
  State<NotificationScreenItem> createState() => _NotificationScreenItemState();
}

class _NotificationScreenItemState extends State<NotificationScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultText(
            text: AppStrings.yourJobSearchAlert,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          FlutterSwitch(
            activeColor: AppColors.primaryColor,
            inactiveColor: Color(0xffD1D5DB),
            value: widget.value,
            onToggle: (bool value) {
              setState(() {
                widget.value = value;
              });
            },
          ),
          // Switch(
          //   activeColor:Color(0xffD6E4FF),
          //
          //   value: true,
          //   onChanged: (value) {},
          //   materialTapTargetSize: MaterialTapTargetSize.padded,
          //   inactiveThumbColor: Color(0xffD6E4FF),
          //
          // )
        ],
      ),
    );
  }
}
