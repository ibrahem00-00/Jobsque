import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text.dart';

class PasswordChangedSuccessfully extends StatelessWidget {
  const PasswordChangedSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(

            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 15.h,),
              Image.asset(AppAssets.passwordSuccessfullyIcon),
              SizedBox(
                height: 5.h,
              ),
              const DefaultText(
                text: AppStrings.passwordChangedSuccessfully,
                fontWeight: FontWeight.w500,
                fontSize: 24,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3.h,
              ),
              const DefaultText(text: AppStrings.yourPasswordHasBeenChanged,maxLines: 3,fontSize: 14,fontWeight: FontWeight.w400,textAlign: TextAlign.center),
              SizedBox(
                height: 33.h,
              ),
              DefaultButton(
                onPressed: () {},
                text: AppStrings.openEmailApp,
                textColor: Colors.white,
                width: double.infinity,
                height: 7.h,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                radius: 3.5.h,
                background: AppColors.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
