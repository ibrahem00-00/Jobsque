import 'package:flutter/material.dart';
import 'package:graduation/utilities/app_strings.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:graduation/view/widgets/default_app_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text.dart';

class SetUpSuccess extends StatelessWidget {
  const SetUpSuccess({Key? key}) : super(key: key);

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
          child: Column(

            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 5.h,),
              Image.asset(AppAssets.successAccountIcon),
              SizedBox(
                height: 5.h,
              ),
              const DefaultText(
                text: AppStrings.setUp,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              SizedBox(
                height: 3.h,
              ),
              const DefaultText(text: AppStrings.customized,maxLines: 2,fontSize: 14,fontWeight: FontWeight.w400,textAlign: TextAlign.center),
              SizedBox(
                height: 40.h,
              ),
              DefaultButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRoutes.loginScreenRoute);
                },
                text: AppStrings.getStarted,
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
