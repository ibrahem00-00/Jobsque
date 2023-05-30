import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utilities/app_assets.dart';
import '../../../../../utilities/app_colors.dart';
import '../../../../../utilities/app_strings.dart';
import '../../../../../utilities/routes.dart';
import '../../../../widgets/default_app_bar.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_text.dart';
import '../../../../widgets/default_text_form_field.dart';

class TwoStepVerificationScreen3 extends StatelessWidget {
   TwoStepVerificationScreen3({Key? key}) : super(key: key);
  var phoneController =TextEditingController();
  var passwordController =TextEditingController();
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
                  SizedBox(height: 3.h,),
                  DefaultText(text: AppStrings.addPhoneNumber,fontSize: 16,fontWeight: FontWeight.w500,),
                  SizedBox(height: 1.h,),
                  DefaultText(text: AppStrings.willSendVerification,fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey.shade400,),
                  SizedBox(height: 2.h,),
                  DefaultFormField(
                    inputFocusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: AppColors.primaryColor)),
                    inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    prefixIcon: CountryListPick(
                        theme: CountryTheme(
                          isShowFlag: true,
                          isShowTitle: false,
                          isShowCode: false,
                          isDownIcon: true,
                          showEnglishName: false,
                        ),
                        // Set default value
                        //initialSelection: '+20',
                        // or
                        initialSelection: 'US',
                        onChanged: (code) {
                          // print(code.name);
                          // print(code.code);

                          print(code?.dialCode);
                          // print(code.flagUri);
                        },
                        // Whether to allow the widget to set a custom UI overlay
                        useUiOverlay: false,
                        // Whether the country list should be wrapped in a SafeArea
                        useSafeArea: false),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.required;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 2.h,),
                  DefaultText(text: AppStrings.enterYourNewPassword,fontSize: 16,fontWeight: FontWeight.w500,),
                  SizedBox(height: 1.h,),
                  DefaultFormField(
                    inputFocusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: AppColors.primaryColor)),
                    inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    controller: passwordController,
                    keyboardType: TextInputType.text,
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
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.twoStepVerificationScreen4Route);
              },
              text: AppStrings.sendCode,
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
