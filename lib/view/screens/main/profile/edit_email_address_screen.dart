import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_form_field.dart';
class EditEmailAddressScreen extends StatelessWidget {
   EditEmailAddressScreen({Key? key}) : super(key: key);
var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.emailAddress,
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
                  DefaultText(text: AppStrings.mainEmailAddress,fontSize: 16,fontWeight: FontWeight.w400,),
                  SizedBox(height: 1.h,),
                  DefaultFormField(
                    inputFocusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: AppColors.primaryColor)),
                    inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: AppStrings.email,
                    prefixIcon: Image.asset('assets/sms.png'),
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
