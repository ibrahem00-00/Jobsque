import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:graduation/view_model/main/complete_profile/complete_profile_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_form_field.dart';

// ignore: must_be_immutable
class EducationScreen extends StatelessWidget {
   EducationScreen({Key? key}) : super(key: key);
  var universityController = TextEditingController();
  var titleController = TextEditingController();
  var startYearController = TextEditingController();
  var endYearController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.education,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 75.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400,width: .5)
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    DefaultText(
                      text: AppStrings.university,
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
                          borderSide: BorderSide(color: AppColors.primaryColor)),
                      inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      controller: universityController,
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
                      text: AppStrings.title,
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
                          borderSide: BorderSide(color: AppColors.primaryColor)),
                      inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      controller: titleController,
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
                          borderSide: BorderSide(color: AppColors.primaryColor)),
                      inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      controller: startYearController,
                      keyboardType: TextInputType.datetime,
                      suffixIcon: ImageIcon(AssetImage(AppAssets.calendarIcon),color: AppColors.neutral,size: 35,),
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
                      text: AppStrings.endYear,
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
                          borderSide: BorderSide(color: AppColors.primaryColor)),
                      inputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      controller: endYearController,
                      keyboardType: TextInputType.datetime,
                      suffixIcon: ImageIcon(AssetImage(AppAssets.calendarIcon),color: AppColors.neutral,size: 35,),
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
                          if(formKey.currentState!.validate()){
                            context.read<CompleteProfileCubit>().addEducation(
                                universty: universityController.text,
                                title: titleController.text,
                                start: startYearController.text,
                                end: endYearController.text,);
                            print(universityController.text);
                            print(titleController.text);
                            print(startYearController.text);
                            print(endYearController.text);
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
                  ],) ,
                ),
              )
            ],),
          ),
        ),
      ),
    );
  },
);
  }
}
