import 'package:flutter/material.dart';
import 'package:graduation/view/widgets/default_button.dart';
import 'package:graduation/view/widgets/default_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/routes.dart';
import '../../widgets/default_app_bar.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: DefaultAppBar(
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Image.asset(
                AppAssets.logo,
                height: 100,
                width: 90,
              ),
              SizedBox(
                width: 5.w,
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 50),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultText(
                  text: AppStrings.resetPassword,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,

                ),
                SizedBox(
                  height: 2.h,
                ),
                const DefaultText(
                    text: AppStrings.emailYouUsed,
                    maxLines: 3,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.start),
                SizedBox(
                  height: 5.h,
                ),
                DefaultFormField(
                  inputFocusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor)),
                  inputBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: AppStrings.entreEmail,
                  prefixIcon: Image.asset(AppAssets.smsIcon),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.required;
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                        .hasMatch(value)) {
                      return (AppStrings.validEmail);
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 38.h,
                ),
                DefaultTextButton(
                  mainTxt: AppStrings.youRememberYourPassword,
                  secondaryTxt: AppStrings.login,
                  mainTxtColor: Colors.grey[400],
                  secondaryTxtColor: AppColors.primaryColor,
                  mainTxtSize: 13.sp,
                  secondaryTxtSize: 13.sp,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, AppRoutes.loginScreenRoute);
                  },
                ),
                SizedBox(
                  height: 1.h,
                ),
                DefaultButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      Navigator.popAndPushNamed(context, AppRoutes.checkYourEmailScreenRoute);
                    }
                  },
                  text: AppStrings.requestPasswordReset,
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
