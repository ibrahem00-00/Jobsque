import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../utilities/app_assets.dart';
import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../../view_model/main/complete_profile/complete_profile_cubit.dart';
import '../../../widgets/cv_item.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_text.dart';

class CompletePortfolioScreen extends StatefulWidget {
  const CompletePortfolioScreen({Key? key}) : super(key: key);

  @override
  State<CompletePortfolioScreen> createState() => _CompletePortfolioScreenState();
}

class _CompletePortfolioScreenState extends State<CompletePortfolioScreen> {
  @override
  void initState() {
    context.read<CompleteProfileCubit>().getPortfolio();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: DefaultAppBar(
              leading: BackButton(color: AppColors.neutral),
              centerTitle: true,
              title: DefaultText(
                text: AppStrings.portfolioScreen,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            preferredSize: Size.fromHeight(50)),
        body: BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultText(
                    text: AppStrings.addPortfolioHere,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 2.h,
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
                              context.read<CompleteProfileCubit>().addPortfolio();
                            },
                            child: Container(
                              height: 5.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: .5)),
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
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) => CvItem(
                              fileName: context
                                  .read<CompleteProfileCubit>()
                                  .portfolioModel
                                  .dataList[index]
                                  .name
                                  .toString(),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 3.h,
                            ),
                        itemCount: context
                            .read<CompleteProfileCubit>()
                            .portfolioModel
                            .dataList
                            .length),
                  )
                ],
              ),
            );
          },
        ));
  }
}
