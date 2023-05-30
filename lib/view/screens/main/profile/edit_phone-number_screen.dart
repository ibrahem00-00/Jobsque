import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_form_field.dart';
class EditPhoneNumberScreen extends StatelessWidget {
   EditPhoneNumberScreen({Key? key}) : super(key: key);
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.phoneNumber,
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
                  SizedBox(height: 4.h,),
                  DefaultText(text: AppStrings.mainPhoneNumber,fontSize: 16,fontWeight: FontWeight.w400,),
                  SizedBox(height: 1.h,),
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
    );
  }
}
