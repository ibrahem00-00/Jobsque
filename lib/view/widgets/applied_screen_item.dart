import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_assets.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_strings.dart';
import 'default_text.dart';

class AppliedScreenItem extends StatelessWidget {
  AppliedScreenItem({
    Key? key,
    required this.name,
    required this.compName,
    required this.location,
    required this.jobType,
    required this.jobTimeType,
  }) : super(key: key);

  String name;
  String compName;
  String location;
  String jobTimeType;
  String jobType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      // height: 15.h,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                  ),
                  child: ImageIcon(AssetImage(AppAssets.smsIcon))),
              SizedBox(
                width: 3.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultText(
                      text: name,
                      color: AppColors.neutral,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    Row(
                      children: [
                        DefaultText(
                          text: compName,
                          color: AppColors.neutral,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        SizedBox(
                          width: .75.w,
                        ),
                        Container(
                          height: 4,
                          width: 4,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.neutral),
                        ),
                        SizedBox(
                          width: .75.w,
                        ),
                        DefaultText(
                          text: location.length >25? 'Cairo, Egypt':location,
                          color: AppColors.neutral,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 9.h,
              ),
              InkWell(
                onTap: () {
                  // setState(() {
                  //   selected = !selected;
                  // });
                  // context.read<SavedCubit>().addSavedJob(job_id: widget.id.toString());
                },
                child: ImageIcon(
                  AssetImage(AppAssets.archiveMinusBlueIcon),
                  size: 30,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 4.h,
                      width: 19.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.secondaryColor),
                      child: DefaultText(
                        text: jobTimeType,
                        color: AppColors.primaryColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 4.h,
                      width: 19.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.secondaryColor),
                      child: DefaultText(
                        text: jobType,
                        color: AppColors.primaryColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
              DefaultText(
                text: 'Posted 2 days ago',
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: .25, color: AppColors.neutral)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.check,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                    // ImageIcon(AssetImage(AppAssets.submittedIcon),color: AppColors.primaryColor,size: 55),
                    SizedBox(
                      width: 5.w,
                    ),
                    ImageIcon(AssetImage(AppAssets.lineIcon),
                        size: 28, color: Colors.grey.shade400),
                    SizedBox(
                      width: 5.w,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.neutral,
                      radius: 24,
                      child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.white,
                          child: DefaultText(
                              text: '2',
                              color: Colors.grey.shade400,
                              fontSize: 16)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    ImageIcon(AssetImage(AppAssets.lineIcon),
                        size: 28, color: Colors.grey.shade400),
                    SizedBox(
                      width: 5.w,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.neutral,
                      radius: 24,
                      child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.white,
                          child: DefaultText(
                              text: '3',
                              color: Colors.grey.shade400,
                              fontSize: 16)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    DefaultText(
                      text: AppStrings.biodata,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColorDark,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    DefaultText(
                      text: AppStrings.typeOfWork,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    DefaultText(
                      text: AppStrings.uploadPortfolio,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
