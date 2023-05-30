import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/routes.dart';
import '../../widgets/default_app_bar.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: DefaultAppBar(
            leading: BackButton(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(

              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 12.h,),
                Image.asset(AppAssets.emailIllustrationIcon),
                SizedBox(
                  height: 5.h,
                ),
                const DefaultText(
                  text: AppStrings.checkYourEmail,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
                SizedBox(
                  height: 3.h,
                ),
                const DefaultText(text: AppStrings.resetPasswordToYourEmailAddress,maxLines: 2,fontSize: 14,fontWeight: FontWeight.w400,textAlign: TextAlign.center),
                SizedBox(
                  height: 30.h,
                ),
                DefaultButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, AppRoutes.createNewPasswordScreenRoute);
                  },
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
      ),
    );
  }
}
