import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/view_model/database/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_assets.dart';
import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../../view_model/main/apply_job/apply_job_cubit.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';

class ApplyJobUploadPortfolio extends StatelessWidget {
  ApplyJobUploadPortfolio({
    Key? key,
    this.jobId,
    required this.name,
    required this.email,
    required this.phone,
    required this.typeOfWork,
  }) : super(key: key);
  dynamic jobId;
  String name;
  String email;
  String phone;
  String typeOfWork;

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
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(
                              Icons.check,
                              size: 30,
                              color: Colors.white,
                            )),
                      ),
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
                                text: '3',
                                color: AppColors.primaryColor,
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
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      DefaultText(
                        text: AppStrings.typeOfWork,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      DefaultText(
                        text: AppStrings.uploadPortfolio,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DefaultText(
                    text: AppStrings.uploadPortfolio,
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
                    text: AppStrings.uploadCV,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 10.h,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColors.neutral, width: .25)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            ImageIcon(
                              AssetImage(AppAssets.pdfIcon),
                              color: AppColors.danger,
                              size: 45,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            DefaultText(
                              text: CacheHelper.get(key: 'name') + '.CV',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        )),
                        ImageIcon(
                          AssetImage(AppAssets.editIcon),
                          color: AppColors.primaryColor,
                          size: 25,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        ImageIcon(
                          AssetImage(AppAssets.closeIcon),
                          color: AppColors.danger,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  DefaultText(
                    text: AppStrings.otherFile,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DottedBorder(
                    dashPattern: [5],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    color: AppColors.primaryColor,
                    child: Container(
                      height: 25.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffECF2FF),
                        borderRadius: BorderRadius.circular(10),

                        //border: Border.all(color:AppColors.primaryColor, width: .25,)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.secondaryColor,
                            child: ImageIcon(
                              AssetImage(AppAssets.documentUploadIcon),
                              size: 30,
                            ),
                          ),
                          DefaultText(
                            text: AppStrings.uploadYourOtherFile,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          DefaultText(
                            text: AppStrings.maxFileSize,
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<ApplyJobCubit>().pickFile();
                            },
                            child: Container(
                              height: 5.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.primaryColor, width: .5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                    AssetImage(AppAssets.addFileIcon),
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  DefaultText(
                                    text: AppStrings.addFile,
                                    fontSize: 16,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
                      print(jobId);
                      context.read<ApplyJobCubit>().applyJob(
                          context: context,
                          email: email,
                          name: name,
                          phone: phone,
                          //cv_file: context.read<ApplyJobCubit>().cv_file,
                          work_type: 'full',
                          other_file: 'other_file',
                          job_id: jobId.toString(),
                          user_id: CacheHelper.get(key: 'id'));
                    },
                    text: AppStrings.submit,
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
