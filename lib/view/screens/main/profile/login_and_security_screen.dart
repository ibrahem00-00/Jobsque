import 'package:flutter/material.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/login_and_security_screen_item.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  LoginAndSecurityScreen({Key? key}) : super(key: key);
  List items = [
    AppStrings.emailAddress,
    AppStrings.phoneNumber,
    AppStrings.changePassword,
    AppStrings.twoStepVerification,
    AppStrings.faceID,
  ];

  List Routes = [
    AppRoutes.editEmailAddressScreenRoute,
    AppRoutes.editPhoneNumberScreenRoute,
    AppRoutes.changePasswordScreenRoute,
    AppRoutes.twoStepVerificationScreenRoute,
    AppRoutes.twoStepVerificationScreenRoute,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.loginAndSecurity,
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
              text: AppStrings.accountAccess,
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 50.h,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => LoginAndSecurityScreenItem(
                        txt: items[index],
                        route: Routes[index],
                        index: index,
                      ),
                  separatorBuilder: (context, index) => Divider(
                        thickness: .5,
                      ),
                  itemCount: items.length),
            ),
          )
        ],
      ),
    );
  }
}
