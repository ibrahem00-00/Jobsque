import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_colors.dart';
import 'default_text.dart';

class LanguageScreenItem extends StatefulWidget {
   LanguageScreenItem({Key? key,required this.img,required this.txt,required this.isSelected,}) : super(key: key);
String txt;
String img;
bool isSelected;
  @override
  State<LanguageScreenItem> createState() => _LanguageScreenItemState();
}

class _LanguageScreenItemState extends State<LanguageScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(widget.img,width: 40,height: 35),
          SizedBox(width: 3.w,),
          Expanded(child: DefaultText(text: widget.txt,fontSize: 16,fontWeight: FontWeight.w500,)),
          Container(
            padding: EdgeInsets.all(1),
            height: 5.h,
            width: 5.w,
            decoration: BoxDecoration(
                border: Border.all(color:Color(0xffACAEBE),width: 1.25 ),
                shape: BoxShape.circle,
                color: Colors.transparent
            ),
            child:CircleAvatar(
              radius: 8,
              backgroundColor:widget.isSelected? AppColors.primaryColor:Colors.transparent,
            ) ,
          ),
        ],
      ),
    );
  }
}
