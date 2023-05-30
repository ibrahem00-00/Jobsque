import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/app_colors.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:graduation/view_model/main/apply_job/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../utilities/app_assets.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import 'apply_job_bio_data.dart';

class ApplyJobScreen extends StatefulWidget {
   ApplyJobScreen({Key? key,required this.jobId}) : super(key: key);
  dynamic jobId;

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  @override
  void initState() {
    context.read<ApplyJobCubit>().currentIndex = 0;
    context.read<ApplyJobCubit>().showDetailsJobs(jobID:widget.jobId,context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplyJobCubit, ApplyJobState>(
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
                  text: AppStrings.jobDetail,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                actions: [
                  ImageIcon(
                    AssetImage(AppAssets.archiveMinusBlueIcon),
                    size: 25,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 4.w,
                  )
                ],
              ),
              preferredSize: Size.fromHeight(50)),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                      height: 7.h,
                      width: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: context.read<ApplyJobCubit>().jobDetailsModel.image.toString() == 'null'
                          ? ImageIcon(AssetImage(AppAssets.smsIcon))
                          : Image.network(context.read<ApplyJobCubit>().jobDetailsModel.image.toString())),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text: context.read<ApplyJobCubit>().jobDetailsModel.name.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        text: context.read<ApplyJobCubit>().jobDetailsModel.comp_name.toString(),
                        color:  AppColors.neutral,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      SizedBox(width: .75.w,),
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:  AppColors.neutral),
                      ),
                      SizedBox(width: .75.w,),
                      DefaultText(
                        text: context.read<ApplyJobCubit>().jobDetailsModel.location.toString().length > 25? 'Cairo , Egypt':context.read<ApplyJobCubit>().jobDetailsModel.location.toString(),
                        color: AppColors.neutral,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 4.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondaryColor),
                        child: DefaultText(
                          text: context.read<ApplyJobCubit>().jobDetailsModel.job_time_type.toString(),
                          color: AppColors.primaryColor,
                          fontSize: 9.sp,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 4.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondaryColor),
                        child: DefaultText(
                          text: context.read<ApplyJobCubit>().jobDetailsModel.job_type.toString(),
                          color: AppColors.primaryColor,
                          fontSize: 9.sp,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 4.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondaryColor),
                        child: DefaultText(
                          text: context.read<ApplyJobCubit>().jobDetailsModel.job_skill.toString(),
                          color: AppColors.primaryColor,
                          fontSize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ToggleSwitch(
                    changeOnTap: true,
                    minWidth: 30.w,
                    cornerRadius: 22.0,
                    fontSize: 14,
                    minHeight: 6.h,
                    activeBgColor: [AppColors.primaryColorDark],
                    //activeBgColors: [[AppColors.primaryColor], [AppColors.primaryColor]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Color(0xffF4F4F5),
                    inactiveFgColor: Color(0xff6B7280),
                    initialLabelIndex:
                        context.read<ApplyJobCubit>().currentIndex,
                    totalSwitches: 3,
                    labels: [
                      AppStrings.description,
                      AppStrings.company,
                      AppStrings.people
                    ],
                    radiusStyle: true,
                    onToggle: (index) {
                      context.read<ApplyJobCubit>().changeIndex(index);
                      print('switched to: $index');
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ConditionalBuilder(
                    builder: (context) {
                      if (context.read<ApplyJobCubit>().currentIndex == 2) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      textAlign: TextAlign.start,
                                      text: '6 Employees For',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    DefaultText(
                                      textAlign: TextAlign.start,
                                      text: 'UI/UX Design',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  width: 40.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        width: .25, color: AppColors.neutral),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DefaultText(
                                        textAlign: TextAlign.start,
                                        text: 'UI/UX Design',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 1.5.h,),
                            SizedBox(
                              height: 60.h,
                              child: ListView.separated(
                                //shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 21,
                                          backgroundImage: AssetImage('assets/logo.png'),
                                        ),
                                        SizedBox(width: 4.w,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            DefaultText(
                                              textAlign: TextAlign.start,
                                              text: 'Dimas Adi Saputro',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),

                                            DefaultText(
                                              textAlign: TextAlign.start,
                                              text: 'Senior UI/UX Designer at Twitter',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 8.w,),
                                        Column(
                                          children: [
                                            DefaultText(
                                              textAlign: TextAlign.start,
                                              text: 'Work during',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            DefaultText(
                                              textAlign: TextAlign.start,
                                              text: '5 Years',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primaryColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) => Divider(
                                        thickness: .5,
                                      ),
                                  itemCount: 3),
                            )
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              textAlign: TextAlign.start,
                              text: AppStrings.contactUs,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: 7.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.neutral, width: .25),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DefaultText(
                                        textAlign: TextAlign.start,
                                        text: AppStrings.email,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      DefaultText(
                                        textAlign: TextAlign.start,
                                        text: context.read<ApplyJobCubit>().jobDetailsModel.comp_email.toString(),
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: 7.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.neutral, width: .25),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DefaultText(
                                        textAlign: TextAlign.start,
                                        text: AppStrings.website,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      DefaultText(
                                        textAlign: TextAlign.start,
                                        text: context.read<ApplyJobCubit>().jobDetailsModel.comp_website.toString(),
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            DefaultText(
                              textAlign: TextAlign.start,
                              text: AppStrings.aboutCompany,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            DefaultText(
                              text:context.read<ApplyJobCubit>().jobDetailsModel.about_comp.toString(),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              maxLines: 30,
                            ),
                          ],
                        );
                      }
                    },
                    condition:
                        context.read<ApplyJobCubit>().currentIndex == 1 ||
                            context.read<ApplyJobCubit>().currentIndex == 2,
                    fallback: (context) {
                      return Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: AppStrings.jobDescription,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            DefaultText(
                              text:context.read<ApplyJobCubit>().jobDetailsModel.job_description.toString() ,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              maxLines: 20,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            DefaultText(
                              text: AppStrings.skillRequired,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            DefaultText(
                              text: context.read<ApplyJobCubit>().jobDetailsModel.name.toString(),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              maxLines: 30,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultButton(
                  onPressed: () {
                    print(context.read<ApplyJobCubit>().jobDetailsModel.id);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ApplyJobBioDataScreen(jobId: context.read<ApplyJobCubit>().jobDetailsModel.id.toString()),));

                    //Navigator.pushNamed(context, AppRoutes.ApplyJobBioDataScreenRoute);
                  },
                  text: AppStrings.applyNow,
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
            ),
          ),
        );
      },
    );
  }
}
