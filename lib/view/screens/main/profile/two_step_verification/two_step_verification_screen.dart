import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utilities/app_colors.dart';
import '../../../../../utilities/app_strings.dart';
import '../../../../widgets/default_app_bar.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_text.dart';
class TwoStepVerificationScreen extends StatefulWidget {
   TwoStepVerificationScreen({Key? key}) : super(key: key);
   bool value=false;
  @override
  State<TwoStepVerificationScreen> createState() => _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState extends State<TwoStepVerificationScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.twoStepVerification,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.neutral,width: .25)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText(
                          maxLines: 2,
                          text: AppStrings.secureYourAccount,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                        FlutterSwitch(
                          height: 5.h,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: Color(0xffD1D5DB),
                          value: widget.value,
                          onToggle: (bool value) {
                            setState(() {
                              widget.value = value;
                            });
                          },
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 4.h,),
                  Row(children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.secondaryColor,
                      child: ImageIcon(AssetImage(AppAssets.lockIcon),color: AppColors.primaryColor,),
                    ),
                    SizedBox(width: 1.w,),
                    DefaultText(text: AppStrings.twoStepVerificationProvides,fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey.shade400,)
                  ],),
                  SizedBox(height: 3.h,),
                  Row(children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.secondaryColor,
                      child: ImageIcon(AssetImage(AppAssets.driveIcon),color: AppColors.primaryColor,),
                    ),
                    SizedBox(width: 1.w,),
                    DefaultText(text: AppStrings.twoStepVerificationProvides,fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey.shade400,)
                  ],),
                ],
              ),
            ),
            DefaultButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.twoStepVerificationScreen2Route);
              },
              text: AppStrings.next,
              textColor: Colors.white,
              width: double.infinity,
              height: 7.h,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              radius: 3.5.h,
              background: AppColors.primaryColor,
            ),
            SizedBox(
              height: 3.h,
            )
          ],
        ),
      ),
    );
  }
}
