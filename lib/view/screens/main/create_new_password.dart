import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/view_model/main/reset_password/reset_password_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/routes.dart';
import '../../widgets/default_app_bar.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_form_field.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

var passwordController = TextEditingController();
var newPasswordController = TextEditingController();

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6.h,),
                    const DefaultText(
                      text: AppStrings.createNewPassword,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,

                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const DefaultText(
                        text: AppStrings.setYourNewPassword,
                        maxLines: 3,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        textAlign: TextAlign.start),
                    SizedBox(
                      height: 5.h,
                    ),
                    DefaultFormField(
                      inputFocusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: passwordController.text == ''
                              ?AppColors.primaryColor:
                          context.read<ResetPasswordCubit>().color
                              ?  AppColors.primaryColor:AppColors.danger)),
                      inputBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.password,
                      obscureText: context.read<ResetPasswordCubit>().passwordVisible,
                      prefixIcon: Image.asset(AppAssets.lockIcon),
                      maxLines: 1,
                      suffixIcon: IconButton(
                          onPressed: () {
                            context.read<ResetPasswordCubit>().changeVisibility();

                          },
                          icon: context.read<ResetPasswordCubit>().passwordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context.read<ResetPasswordCubit>().changeColor(value: value);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultText(
                      text: AppStrings.passwordValidation,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: passwordController.text == ''
                          ? Colors.grey[400]
                          : context.read<ResetPasswordCubit>().color
                          ? AppColors.success
                          : AppColors.danger,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      inputFocusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.primaryColor)),
                      inputBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: newPasswordController.text == ''
                              ?AppColors.primaryColor:
                          context.read<ResetPasswordCubit>().matchColor
                              ?  AppColors.primaryColor:AppColors.danger)),
                      controller: newPasswordController,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.password,
                      obscureText: context.read<ResetPasswordCubit>().newPasswordVisible,
                      prefixIcon: Image.asset(AppAssets.lockIcon),
                      maxLines: 1,
                      suffixIcon: IconButton(
                          onPressed: () {
                            context.read<ResetPasswordCubit>().changeVisibility1();
                          },
                          icon: context.read<ResetPasswordCubit>().newPasswordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context.read<ResetPasswordCubit>().changeColor(matchValue: value,value: passwordController.text);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultText(
                      text: AppStrings.bothPasswordMustMatch,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: newPasswordController.text == ''
                          ? Colors.grey[400]
                          : context.read<ResetPasswordCubit>().matchColor
                          ? AppColors.success
                          : AppColors.danger,
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    DefaultButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, AppRoutes.passwordChangedSuccessfullyScreenRoute);
                      },
                      text: AppStrings.resetPassword,
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

        );
      },
    );
  }
}
