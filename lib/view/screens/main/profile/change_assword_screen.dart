import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_assets.dart';
import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_form_field.dart';
class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({Key? key}) : super(key: key);
var oldPasswordController = TextEditingController();
var newPasswordController = TextEditingController();
var confirmNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.changePassword,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 78.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h,),
                    DefaultText(text: AppStrings.enterYourOldPassword,fontSize: 16,fontWeight: FontWeight.w400,),
                    SizedBox(height: 1.h,),
                    DefaultFormField(
                      inputFocusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          BorderSide(color: AppColors.primaryColor)),
                      inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      controller: oldPasswordController,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.userName,
                      prefixIcon: Image.asset(AppAssets.lockIcon),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4.h,),
                    DefaultText(text: AppStrings.enterYourNewPassword,fontSize: 16,fontWeight: FontWeight.w400,),
                    SizedBox(height: 1.h,),
                    DefaultFormField(
                      inputFocusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          BorderSide(color: AppColors.primaryColor)),
                      inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      controller: newPasswordController,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.userName,
                      prefixIcon: Image.asset(AppAssets.lockIcon),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4.h,),
                    DefaultText(text: AppStrings.confirmYourNewPassword,fontSize: 16,fontWeight: FontWeight.w400,),
                    SizedBox(height: 1.h,),
                    DefaultFormField(
                      inputFocusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          BorderSide(color: AppColors.primaryColor)),
                      inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      controller: confirmNewPasswordController,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.userName,
                      prefixIcon: Image.asset(AppAssets.lockIcon),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              DefaultButton(
                onPressed: () {},
                text: AppStrings.save,
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
      ),
    );
  }
}
