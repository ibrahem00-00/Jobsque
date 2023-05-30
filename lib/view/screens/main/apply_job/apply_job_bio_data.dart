import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_form_field.dart';
import 'apply_job_type_of_work.dart';

class ApplyJobBioDataScreen extends StatelessWidget {
  ApplyJobBioDataScreen({Key? key, this.jobId}) : super(key: key);
  dynamic jobId;

  var userNameController = TextEditingController();

  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.bioData,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    // ImageIcon(AssetImage(AppAssets.submittedIcon),color: AppColors.primaryColor,size: 55),
                    SizedBox(
                      width: 5.w,
                    ),
                    ImageIcon(AssetImage(AppAssets.lineIcon),
                        size: 30, color: Colors.grey.shade400),
                    SizedBox(
                      width: 5.w,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.neutral,
                      radius: 26,
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: DefaultText(
                              text: '2',
                              color: Colors.grey.shade400,
                              fontSize: 16)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    ImageIcon(AssetImage(AppAssets.lineIcon),
                        size: 30, color: Colors.grey.shade400),
                    SizedBox(
                      width: 5.w,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.neutral,
                      radius: 26,
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: DefaultText(
                              text: '3',
                              color: Colors.grey.shade400,
                              fontSize: 16)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    DefaultText(
                      text: AppStrings.biodata,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColorDark,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    DefaultText(
                      text: AppStrings.typeOfWork,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    DefaultText(
                      text: AppStrings.uploadPortfolio,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: AppStrings.biodata,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    DefaultText(
                      text: AppStrings.fillInYourBioDataCorrectly,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    DefaultText(
                      text: AppStrings.fullName,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    DefaultFormField(
                      inputFocusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: AppColors.primaryColor)),
                      inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.userName,
                      prefixIcon: Image.asset(AppAssets.profileIcon),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    DefaultText(
                      text: AppStrings.email,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
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

                    SizedBox(
                      height: 4.h,
                    ),
                    DefaultText(
                      text: AppStrings.noHandphone,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
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
                      hintText: AppStrings.noHandphone,
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DefaultButton(
                          onPressed: () {
                            print(jobId);
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ApplyJobTypeOfWork(
                                      jobId: jobId,
                                      name: userNameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                    ),
                                  ));
                            }
                          },
                          text: AppStrings.next,
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
                    )

                    // CountryListPick(
                    //     theme: CountryTheme(
                    //       isShowFlag: true,
                    //       isShowTitle: false,
                    //       isShowCode: false,
                    //       isDownIcon: true,
                    //       showEnglishName: false,
                    //     ),
                    //     // Set default value
                    //     //initialSelection: '+20',
                    //     // or
                    //      initialSelection: 'US',
                    //     onChanged: (code) {
                    //       // print(code.name);
                    //       // print(code.code);
                    //       // print(code.dialCode);
                    //       // print(code.flagUri);
                    //     },
                    //     // Whether to allow the widget to set a custom UI overlay
                    //     useUiOverlay: false,
                    //     // Whether the country list should be wrapped in a SafeArea
                    //     useSafeArea: false
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       DefaultButton(
      //         onPressed: () {
      //           print(jobId);
      //           Navigator.push(context, MaterialPageRoute(
      //             builder: (context) =>
      //                 ApplyJobTypeOfWork(jobId: jobId,
      //                     name:userNameController.text,
      //                     email:emailController.text ,
      //                     phone:phoneController.text,
      //                 ),));
      //         },
      //         text: AppStrings.next,
      //         textColor: Colors.white,
      //         width: double.infinity,
      //         height: 7.h,
      //         fontSize: 15.sp,
      //         fontWeight: FontWeight.w500,
      //         radius: 3.5.h,
      //         background: AppColors.primaryColor,
      //       ),
      //       SizedBox(
      //         height: 2.h,
      //       )
      //     ],
      //   ),
      // )
    );
  }
}
