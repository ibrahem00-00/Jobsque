import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:graduation/view_model/database/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../../utilities/routes.dart';
import '../../../../view_model/main/home_layout/home_layout_cubit.dart';
import '../../../../view_model/main/profile/profile_cubit.dart';
import '../../../widgets/profile_column.dart';
import '../../../widgets/profile_row.dart';

class ProfileScreen extends StatelessWidget {
   const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 34.h,
                    // width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            child: Container(
                              color: const Color(0xffD6E4FF),
                              height: 28.h,
                              width: 100.w,
                            )
                        ),
                        Positioned(
                            top: 6.h,

                            child: SizedBox(
                              width: 100.w,
                              //padding:const EdgeInsets.symmetric(horizontal: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  IconButton(onPressed: () {
                                    context.read<HomeLayoutCubit>().changeIndex(0);
                                  },
                                      icon: const Icon(
                                          Icons.arrow_back_outlined)),
                                  DefaultText(
                                    text: AppStrings.profile, fontSize: 20,),
                                  IconButton(onPressed: () {


                                    showAnimatedDialog(
                                      alignment: Alignment.center,
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return ClassicGeneralDialogWidget(
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child:  Text(AppStrings.cancel)),
                                            ElevatedButton(
                                                onPressed: ()  {
                                                  CacheHelper.put(key: 'logged', value: "false");
                                                  CacheHelper.removeData(key: "name");
                                                  CacheHelper.removeData(key: "email");
                                                  CacheHelper.removeData(key: "id");
                                                  CacheHelper.removeData(key: "token");
                                                  CacheHelper.removeData(key: "AppliedJobId");
                                                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.splashScreenRoute, (route) => false);
                                                },
                                                child:  Text(AppStrings.sure)),
                                          ],
                                          negativeText: AppStrings.cancel,
                                          positiveText: AppStrings.sure,
                                          titleText: AppStrings.logOut,
                                          contentText: AppStrings.areYouSure,
                                        );
                                      },
                                      animationType: DialogTransitionType.scale,
                                      curve: Curves.fastOutSlowIn,
                                      duration: const Duration(milliseconds: 350),
                                    );

                                  },
                                      icon: ImageIcon(
                                        AssetImage(AppAssets.logoutIcon),
                                        color: Colors.red,)),
                                ],
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(AppAssets.smsIcon),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultText(
                            text:
                            CacheHelper.get(key: "name"),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 1.h,),
                        DefaultText(
                          text: context.read<ProfileCubit>().editProfileBioAddressMobileModel.bio.toString()=="null"? '':context.read<ProfileCubit>().editProfileBioAddressMobileModel.bio.toString(),
                          fontSize: 14.sp,
                          color: AppColors.neutral,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 2.h,),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffFAFAFA),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileColumn(
                                  title: AppStrings.Applied, number: "46"),
                              VerticalDivider(
                                color: Colors.black,
                                endIndent: 10,
                                indent: 10,
                              ),
                              ProfileColumn(
                                  title: AppStrings.reviewed, number: "23"),
                              VerticalDivider(
                                color: Colors.black,
                                endIndent: 10,
                                indent: 10,
                              ),
                              ProfileColumn(
                                  title: AppStrings.contacted, number: "16"),

                            ],
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(text: AppStrings.about, fontSize: 16),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    AppRoutes.completeProfileScreenRoute);
                              },
                              child: Text(
                                AppStrings.edit, style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor),),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 5.h,
                    color: AppColors.Neutral200,
                    child: DefaultText(text: AppStrings.general,
                      fontSize: 14,
                      color: Colors.grey.shade500,),
                  ),
                  SizedBox(height: 3.h,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ProfileRow(prefixIcon: Icons.person,
                            title: AppStrings.editProfile,
                            onPress: () {
                              Navigator.pushNamed(
                                  context,
                                  AppRoutes.editProfileRouteScreenRoute);
                            }),
                        SizedBox(height: 1.h,),
                        Divider(
                          thickness: 1, color: AppColors.Neutral200,),
                        SizedBox(height: 1.h,),
                        ProfileRow(prefixIcon: Icons.photo,
                            title: AppStrings.Portfolio,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.portfolioScreenRoute);
                            }),
                        SizedBox(height: 1.h,),
                        Divider(
                          thickness: 1, color: AppColors.Neutral200,),
                        SizedBox(height: 1.h,),
                        ProfileRow(prefixIcon: Icons.language,
                            title: AppStrings.Language,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.languageScreenRoute);
                            }),
                        SizedBox(height: 1.h,),
                        Divider(
                          thickness: 1, color: AppColors.Neutral200,),
                        SizedBox(height: 1.h,),
                        ProfileRow(prefixIcon: Icons.notifications,
                            title: AppStrings.Notification,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.notificationScreenRoute);
                            }),
                        SizedBox(height: 1.h,),
                        Divider(
                          thickness: 1, color: AppColors.Neutral200,),
                        SizedBox(height: 1.h,),
                        ProfileRow(prefixIcon: Icons.security_rounded,
                            title: AppStrings.loginAndSecurity,
                            onPress: () {
                              Navigator.pushNamed(context,
                                  AppRoutes.loginAndSecurityScreenRoute);
                            }),
                        SizedBox(height: 1.h,),
                        Divider(
                          thickness: 1, color: AppColors.Neutral200,),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 5.h,
                    color: AppColors.Neutral200,
                    child: DefaultText(text: AppStrings.Others,
                      fontSize: 14,
                      color: Colors.grey.shade500,),
                  ),
                  SizedBox(height: 3.h,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ProfileRow(title: AppStrings.accessibility,
                          onPress: () {},
                          needSuffix: false,),
                        SizedBox(height: 1.h,),
                         Divider(
                          thickness: 1, color: AppColors.Neutral200,),
                        SizedBox(height: 1.h,),
                        ProfileRow(title: AppStrings.helpCenter,
                          onPress: () {
                            Navigator.pushNamed(
                                context, AppRoutes.helpCenterScreenRoute);
                          },
                          needSuffix: false,),
                        SizedBox(height: 1.h,),
                        Divider(
                          thickness: 1, color: AppColors.Neutral200,),
                        SizedBox(height: 1.h,),
                        ProfileRow(title: AppStrings.terms,
                          onPress: () {
                            Navigator.pushNamed(
                                context, AppRoutes.termsConditionsScreenRoute);
                          },
                          needSuffix: false,),
                        SizedBox(height: 1.h,),
                        Divider(
                          thickness: 1, color: AppColors.Neutral200,),
                        SizedBox(height: 1.h,),
                        ProfileRow(title: AppStrings.privacyPolicy,
                          onPress: () {
                            Navigator.pushNamed(
                                context, AppRoutes.privacyPolicyScreenRoute);
                          },
                          needSuffix: false,),
                        SizedBox(height: 1.h,),
                        Divider(
                          thickness: 1, color: AppColors.Neutral200,),
                        SizedBox(height: 1.h,),
                      ],
                    ),
                  )
                ],
              ),
            )
        );
      },
    );
  }
}
