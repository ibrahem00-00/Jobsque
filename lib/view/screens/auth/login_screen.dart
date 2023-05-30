import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/view/widgets/default_app_bar.dart';
import 'package:graduation/view/widgets/default_button.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:graduation/view_model/auth/login/login_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/routes.dart';
import '../../widgets/default_text_button.dart';
import '../../widgets/default_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Color? color;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: DefaultAppBar(
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
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: AppStrings.login,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultText(
                    text: AppStrings.findJob,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        DefaultFormField(
                          inputFocusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor)),
                          inputBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: usernameController,
                          keyboardType: TextInputType.emailAddress,
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
                          height: 2.h,
                        ),
                        DefaultFormField(
                          inputFocusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor)),
                          inputBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          hintText: AppStrings.password,
                          prefixIcon: Image.asset(AppAssets.lockIcon),
                          obscureText: context.read<LoginCubit>().passwordVisible,
                          maxLines: 1,
                          suffixIcon: IconButton(
                              onPressed: () {
                                context.read<LoginCubit>().changeVisibility();
                              },
                              icon: context.read<LoginCubit>().passwordVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
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
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: context.read<LoginCubit>().isChecked,
                              onChanged: (bool? value) {
                                context.read<LoginCubit>().changeCheck();
                              },
                              activeColor: AppColors.primaryColor,
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            DefaultText(
                              text: AppStrings.rememberMe,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.forgetPasswordScreenRoute);
                          },
                          child: DefaultText(
                            text: AppStrings.forgotPassword,
                            color: AppColors.primaryColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  DefaultTextButton(
                    mainTxt: AppStrings.dontHaveAccount,
                    secondaryTxt: AppStrings.register,
                    mainTxtColor: Colors.grey[400],
                    secondaryTxtColor: AppColors.primaryColor,
                    mainTxtSize: 13.sp,
                    secondaryTxtSize: 13.sp,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.registerScreenRoute);
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        //context.read<LoginCubit>().loginByEmailAndPassword(usernameController.text, passwordController.text, context);
                        context.read<LoginCubit>().loginPost(email: usernameController.text, password: passwordController.text,context:  context);
                      }
                    },
                    text: AppStrings.login,
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
                        text: AppStrings.orLoginWithAccount,
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
                        onPressed: () {
                          context.read<LoginCubit>().signInByGoogle().then((value){
                            Navigator.popAndPushNamed(context, AppRoutes.homeLayoutScreenRoute);

                          });
                        },
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
