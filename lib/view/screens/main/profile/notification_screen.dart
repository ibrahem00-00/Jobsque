import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/notification_screen_item.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({Key? key}) : super(key: key);
List jobNotificationList = [
  AppStrings.yourJobSearchAlert,
  AppStrings.jobApplicationUpdate,
  AppStrings.jobApplicationReminders,
  AppStrings.jobsYouMayBeInterestedIn,
  AppStrings.jobSeekerUpdates,
];
   List otherNotificationList = [
     AppStrings.showProfile,
     AppStrings.allMessage,
     AppStrings.messageNudges,
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.Notification,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            height: 4.h,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.secondaryColor),
            child: DefaultText(
              text: AppStrings.jobNotification,
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40.h,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>NotificationScreenItem(txt:jobNotificationList[index]) ,
                  separatorBuilder:(context, index) => Divider(thickness: .5,), itemCount: jobNotificationList.length),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            height: 4.h,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.secondaryColor),
            child: DefaultText(
              text: AppStrings.otherNotification,
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 1.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 35.h,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                //shrinkWrap: true,
                  itemBuilder: (context, index) =>NotificationScreenItem(txt:otherNotificationList[index]) ,
                  separatorBuilder:(context, index) => Divider(thickness: .5,), itemCount: otherNotificationList.length),
            ),
          ),
        ],
      ),
    );
  }
}
