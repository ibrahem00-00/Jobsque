import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../../../utilities/app_colors.dart';
import '../../../../../utilities/app_strings.dart';
import '../../../../../utilities/routes.dart';
import '../../../../widgets/default_app_bar.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_text.dart';

class TwoStepVerificationScreen4 extends StatefulWidget {
  const TwoStepVerificationScreen4({Key? key}) : super(key: key);

  @override
  State<TwoStepVerificationScreen4> createState() =>
      _TwoStepVerificationScreen4State();
}

class _TwoStepVerificationScreen4State
    extends State<TwoStepVerificationScreen4> {
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
                    height: 3.h,
                  ),
                  DefaultText(
                    text: AppStrings.enterTheDigit,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultText(
                    text: AppStrings.pleaseConfirmYourAccount,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade400,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  VerificationCode(
                    fullBorder: true,
                    textStyle: TextStyle(fontSize: 14, color: AppColors.neutral),
                    keyboardType: TextInputType.number,
                    length: 6,
                    onCompleted: (String value) {
                      setState(() {
                        // _code = value;
                      });
                    },
                    onEditing: (bool value) {
                      setState(() {
                        // _onEditing = value;
                      });
                      // if (!_onEditing) FocusScope.of(context).unfocus();
                    },
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      DefaultText(
                        text: AppStrings.resendCode,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                      Countdown(
                        seconds: 50,
                        build: (BuildContext context, double time) => DefaultText(
                          text: time.toInt().toString(),
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                        interval: Duration(seconds: 1),
                        onFinished: () {
                          print('Timer is done!');
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            DefaultButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.profileScreenRoute);
              },
              text: AppStrings.verify,
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
