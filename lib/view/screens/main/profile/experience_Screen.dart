import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../../view_model/main/complete_profile/complete_profile_cubit.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_form_field.dart';

class ExperienceScreen extends StatelessWidget {
  ExperienceScreen({Key? key}) : super(key: key);
  var positionController = TextEditingController();
  var typeOfWorkController = TextEditingController();
  var companyNameController = TextEditingController();
  var locationController = TextEditingController();
  var startYearController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.experience,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 85.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400, width: .5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text: AppStrings.position,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormField(
                          inputFocusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors
                                  .primaryColor)),
                          inputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: positionController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.required;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        DefaultText(
                          text: AppStrings.typeOfWork,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormField(
                          inputFocusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors
                                  .primaryColor)),
                          inputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: typeOfWorkController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.required;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        DefaultText(
                          text: AppStrings.companyName,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormField(
                          inputFocusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors
                                  .primaryColor)),
                          inputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: companyNameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.required;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        DefaultText(
                          text: AppStrings.location,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormField(
                          inputFocusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors
                                  .primaryColor)),
                          inputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: locationController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.required;
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              value: true,
                              onChanged: (bool? value) {},
                              activeColor: AppColors.primaryColor,
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            DefaultText(
                              text: AppStrings.iAmCurrentlyWorking,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        DefaultText(
                          text: AppStrings.startYear,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormField(
                          inputFocusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors
                                  .primaryColor)),
                          inputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: startYearController,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.required;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        DefaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<CompleteProfileCubit>().addExperience(
                                  postion: positionController.text,
                                  type_work: typeOfWorkController.text,
                                  comp_name: companyNameController.text,
                                  location: locationController.text,
                                  start: startYearController.text,);
                            }
                          },
                          text: AppStrings.save,
                          textColor: Colors.white,
                          width: double.infinity,
                          height: 7.h,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          radius: 3.5.h,
                          background: AppColors.primaryColor,
                        ),
                      ],),
                  ),
                )
              ],),
          ),
        ),
      ),
    );
  }
}
