import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utilities/app_colors.dart';
import '../../../../../utilities/app_strings.dart';
import '../../../../../utilities/routes.dart';
import '../../../../widgets/default_app_bar.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_text.dart';

class TwoStepVerificationScreen2 extends StatefulWidget {
  TwoStepVerificationScreen2({Key? key}) : super(key: key);
  bool value = false;

  @override
  State<TwoStepVerificationScreen2> createState() =>
      _TwoStepVerificationScreen2State();
}

class _TwoStepVerificationScreen2State
    extends State<TwoStepVerificationScreen2> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 10.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: AppColors.neutral, width: .25)),
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
                  SizedBox(
                    height: 4.h,
                  ),
                  DefaultText(
                    text: AppStrings.selectAVerificationMethod,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 7.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColors.neutral, width: .25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText(
                          text: AppStrings.telephoneNumber,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultText(text: AppStrings.note,fontWeight: FontWeight.w400,fontSize: 14,color: Colors.grey.shade500,maxLines: 4,)
                ],
              ),
            ),
            DefaultButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.twoStepVerificationScreen3Route);
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
