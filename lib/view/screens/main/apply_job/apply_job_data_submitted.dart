import 'package:flutter/material.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';

class ApplyJobDataSubmitted extends StatelessWidget {
  const ApplyJobDataSubmitted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: DefaultAppBar(
              leading: BackButton(color: AppColors.neutral),
              centerTitle: true,
              title: DefaultText(
                text: AppStrings.applyJob,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            preferredSize: Size.fromHeight(50)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Image.asset(
                  AppAssets.dataSubmittedIcon,
                  width: 50.w,
                  height: 30.h,
                ),
                DefaultText(
                  text: AppStrings.yourSuccessfullySent,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultText(
                  text: AppStrings.youWillGetMessageFromOurTeam,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultButton(
                onPressed: () {Navigator.popAndPushNamed(context, AppRoutes.homeLayoutScreenRoute);},
                text: AppStrings.backHome,
                textColor: Colors.white,
                width: double.infinity,
                height: 7.h,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                radius: 3.5.h,
                background: AppColors.primaryColor,
              ),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        ));
  }
}
