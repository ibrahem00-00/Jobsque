import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_colors.dart';
import 'default_text.dart';

class SheetFilterItem extends StatefulWidget {
  SheetFilterItem({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  State<SheetFilterItem> createState() => _SheetFilterItemState();
}

class _SheetFilterItemState extends State<SheetFilterItem> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 5.h,
        width: 25.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isClicked ? AppColors.secondaryColor : Colors.transparent,
            border: Border.all(
                color: isClicked
                    ? AppColors.primaryColor
                    : Colors.grey.shade500)),
        child: DefaultText(
          text: widget.text,
          color: isClicked ? AppColors.primaryColor : Colors.grey.shade500,
          fontSize: 12,
        ),
      ),
    );
  }
}
