import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_colors.dart';
import 'default_text.dart';

class FilterItem extends StatefulWidget {
  FilterItem({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
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
            color: isClicked ? AppColors.primaryColorDark : Colors.transparent,
          border: Border.all(color:isClicked ? AppColors.primaryColorDark : Colors.grey.shade500 )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultText(
              text: widget.text,
              color: isClicked ? Colors.white : Colors.grey.shade500,
              fontSize: 12,
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: isClicked ? Colors.white : Colors.grey.shade500,
            )
          ],
        ),
      ),
    );
  }
}
