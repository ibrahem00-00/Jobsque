import 'package:flutter/material.dart';
import 'package:graduation/utilities/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_strings.dart';
import 'default_text.dart';

class ApplyJobTypeOfWorkItem extends StatefulWidget {
   ApplyJobTypeOfWorkItem({Key? key,required this.text,required this.isSelected,}) : super(key: key);
  String text;
   bool isSelected;
   List items =[
     AppStrings.seniorUXDesigner,
     AppStrings.seniorUIDesigner,
     AppStrings.graphikDesigner,
     AppStrings.frontEndDeveloper
   ];
  @override
  State<ApplyJobTypeOfWorkItem> createState() => _ApplyJobTypeOfWorkItemState();
}


class _ApplyJobTypeOfWorkItemState extends State<ApplyJobTypeOfWorkItem> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(15),
      height: 10.h,
      decoration: BoxDecoration(
        color: widget.isSelected?AppColors.secondaryColor:Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color:widget.isSelected? AppColors.primaryColor:AppColors.neutral, width: .25)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: widget.text,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    DefaultText(
                      text: AppStrings.cV,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    SizedBox(
                      width: .75.w,
                    ),
                    Container(
                      height: 3,
                      width: 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.neutral),
                    ),
                    SizedBox(
                      width: .75.w,
                    ),
                    DefaultText(
                      text: AppStrings.portfolio,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ],
                )
              ],
            ),
          ),
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
