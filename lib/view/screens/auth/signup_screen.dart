import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../view_model/auth/signup/signup_cubit.dart';
import '../../widgets/default_app_bar.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_button.dart';
import '../../widgets/default_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var userNameController = TextEditingController();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: DefaultAppBar(
                leading: BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 90,
                  ),
                  SizedBox(
                    width: 5.w,
                  )
                ],
              )),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: AppStrings.createAccount,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultText(
                    text: AppStrings.findAccount,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultFormField(
                          inputFocusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor)),
                          inputBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: userNameController,
                          keyboardType: TextInputType.text,
                          hintText: AppStrings.userName,
                          prefixIcon: Image.asset('assets/profile.png'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.required;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        DefaultFormField(
                          inputFocusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor)),
                          inputBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: AppStrings.email,
                          prefixIcon: Image.asset('assets/sms.png'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.required;
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                                .hasMatch(value)) {
                              return (AppStrings.validEmail);
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        DefaultFormField(
                          inputFocusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: passwordController.text == ''
                                      ? AppColors.primaryColor
                                      : context.read<SignupCubit>().color
                                          ? AppColors.primaryColor
                                          : AppColors.danger)),
                          inputBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          hintText: AppStrings.password,
                          prefixIcon: Image.asset('assets/lock.png'),
                          obscureText:
                              context.read<SignupCubit>().passwordVisible,
                          maxLines: 1,
                          suffixIcon: IconButton(
                              onPressed: () {
                                context.read<SignupCubit>().changeVisibility();
                              },
                              icon: context.read<SignupCubit>().passwordVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.required;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            context.read<SignupCubit>().changeColor(value);
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
                              : context.read<SignupCubit>().color
                                  ? AppColors.success
                                  : AppColors.danger,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultTextButton(
                    mainTxt: AppStrings.alreadyHaveAnAccount,
                    secondaryTxt: AppStrings.login,
                    mainTxtColor: Colors.grey[400],
                    secondaryTxtColor: AppColors.primaryColor,
                    mainTxtSize: 13.sp,
                    secondaryTxtSize: 13.sp,
                    onPressed: () {
                      Navigator.popAndPushNamed(
                          context, AppRoutes.loginScreenRoute);
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // context.read<SignupCubit>().registerByEmailAndPassword(emailController.text, passwordController.text, userNameController.text, context);
                        context.read<SignupCubit>().postRegister(
                            name: userNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            context: context);
                      }
                    },
                    text: AppStrings.createAccount,
                    textColor: Colors.grey[500],
                    width: double.infinity,
                    height: 7.h,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    radius: 3.5.h,
                    background: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 1,
                        width: 15.w,
                        decoration: BoxDecoration(color: Colors.grey[400]),
                      ),
                      DefaultText(
                        text: AppStrings.orSignUpWithAccount,
                        color: Colors.grey[400],
                        fontSize: 13.sp,
                      ),
                      Container(
                        height: 1,
                        width: 15.w,
                        decoration: BoxDecoration(color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleAuthButton(
                        text: AppStrings.google,
                        onPressed: () {},
                        style: AuthButtonStyle(
                          borderColor: Colors.grey,
                          width: 40.w,
                          height: 6.h,
                          elevation: 0,
                          buttonColor: Colors.transparent,
                          borderWidth: 1,
                          textStyle: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                      FacebookAuthButton(
                        text: AppStrings.facebook,
                        onPressed: () {},
                        style: AuthButtonStyle(
                          iconColor: Colors.blue,
                          borderColor: Colors.grey,
                          width: 40.w,
                          height: 6.h,
                          elevation: 0,
                          buttonColor: Colors.transparent,
                          borderWidth: 1,
                          textStyle: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ],
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
