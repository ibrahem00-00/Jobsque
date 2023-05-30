import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../model/work_type_screen_model/work_type_screen_model.dart';
import '../../../../utilities/app_assets.dart';
import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../../view_model/main/apply_job/apply_job_cubit.dart';
import '../../../widgets/apply_job_type_of_work_item.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';
import 'apply_job_upload_portfolio.dart';

class ApplyJobTypeOfWork extends StatefulWidget {
  ApplyJobTypeOfWork(
      {Key? key, this.jobId, required this.name, required this.email, required this.phone, this.typeOfWork = '',})
      : super(key: key);
  dynamic jobId;
  String name;
  String email;
  String phone;
  String typeOfWork;

  @override
  State<ApplyJobTypeOfWork> createState() => _ApplyJobTypeOfWorkState();
}

class _ApplyJobTypeOfWorkState extends State<ApplyJobTypeOfWork> {
  List items = [
    AppStrings.seniorUXDesigner,
    AppStrings.seniorUIDesigner,
    AppStrings.graphikDesigner,
    AppStrings.frontEndDeveloper
  ];

  // List <WorkTypeScreenModel> itemList = [
  //   WorkTypeScreenModel(txt: AppStrings.seniorUXDesigner, isSelected: false,),
  //   WorkTypeScreenModel(txt: AppStrings.seniorUIDesigner, isSelected: false,),
  //   WorkTypeScreenModel(txt: AppStrings.graphikDesigner, isSelected: false,),
  //   WorkTypeScreenModel(txt: AppStrings.frontEndDeveloper, isSelected: false,),
  // ];

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
                    text: AppStrings.applyJob,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                preferredSize: Size.fromHeight(50)),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          size: 30, color: AppColors.primaryColor),
                      SizedBox(
                        width: 5.w,
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 26,
                        child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: DefaultText(
                                text: '2',
                                color: AppColors.primaryColor,
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
                        color: AppColors.primaryColorDark,
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
                        text: AppStrings.typeOfWork,
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
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  context.read<ApplyJobCubit>().changeSelection(index);
                                  // for (int i = 0; i < itemList.length; i++) {
                                  //   if (i == index) {
                                  //     setState(() {
                                  //       itemList[i].isSelected = true;
                                  //     });
                                  //   } else {
                                  //     setState(() {
                                  //       itemList[i].isSelected = false;
                                  //     });
                                  //   }
                                  // }
                                },
                                child: ApplyJobTypeOfWorkItem(
                                  text: context.read<ApplyJobCubit>().itemList[index].txt,
                                  isSelected: context.read<ApplyJobCubit>().itemList[index].isSelected,
                                ));
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(
                                height: 2.h,
                              ),
                          itemCount: context.read<ApplyJobCubit>().itemList.length),
                    ],
                  )
                ],
              ),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultButton(
                    onPressed: () {
                      print(widget.jobId);
                      print(widget.typeOfWork);
                      print(widget.name);
                      print(widget.email);
                      print(widget.phone);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            ApplyJobUploadPortfolio(
                                jobId: widget.jobId,
                                name: widget.name,
                                email: widget.email,
                                phone: widget.phone,
                                typeOfWork: widget.typeOfWork),));
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
              ),
            ));
      },
    );
  }
}
