import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_colors.dart';
import 'default_text.dart';

// ignore: must_be_immutable
class ProfileRow extends StatelessWidget {
   ProfileRow({Key? key, this.prefixIcon,required this.title,required this.onPress,this.needSuffix=true}) : super(key: key);

   bool needSuffix;
   IconData? prefixIcon;
   String title;
   @required Function onPress;
  @override
  Widget build(BuildContext context) {
    return needSuffix==true?
      Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.secondaryColor,
          child: Icon(prefixIcon),
        ),
        SizedBox(width: 4.w,),
        Expanded(child: DefaultText(text: title,fontSize: 16,),),
        GestureDetector(onTap: () =>onPress() ,
            child: Icon(Icons.arrow_forward,size: 20,)),
      ],
    ):Row(children: [
      Expanded(child: DefaultText(text: title,fontSize: 18,)),
      GestureDetector(onTap: () =>onPress() ,
          child: Icon(Icons.arrow_forward,size: 20,)),
    ],
    );
  }
}
