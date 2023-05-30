import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/view_model/main/saved/saved_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../view_model/main/home_layout/home_layout_cubit.dart';
import '../../widgets/default_app_bar.dart';
import '../../widgets/default_text.dart';
import '../../widgets/saved_jobs_item.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    context.read<SavedCubit>().showSavedJobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavedCubit, SavedState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: PreferredSize(
                child: DefaultAppBar(
                  leading: BackButton(onPressed: (){
                    context.read<HomeLayoutCubit>().changeIndex(0);
                  },color: AppColors.neutral),
                  centerTitle: true,
                  title: DefaultText(
                    text: AppStrings.saved,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                preferredSize: Size.fromHeight(50)),
            body:state is SavedLoadingState? Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ): context.read<SavedCubit>().savedJobsModel.dataList.isNotEmpty
                ? Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 4.h,
                        width: double.infinity,
                        decoration:
                            BoxDecoration(color: AppColors.secondaryColor),
                        child: DefaultText(
                          text:
                              '${context.read<SavedCubit>().savedJobsModel.dataList.length} Job Saved',
                          color: AppColors.neutral,
                          fontSize: 12,
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => SavedJobsItem(
                                  id: context
                                      .read<SavedCubit>()
                                      .savedJobsModel
                                      .dataList[index]
                                      .id
                                      .toString(),
                                  name: context
                                      .read<SavedCubit>()
                                      .savedJobsModel
                                      .dataList[index]
                                      .name
                                      .toString(),
                                  location: context
                                      .read<SavedCubit>()
                                      .savedJobsModel
                                      .dataList[index]
                                      .location
                                      .toString(),
                                  comp_name: context
                                      .read<SavedCubit>()
                                      .savedJobsModel
                                      .dataList[index]
                                      .comp_name
                                      .toString(),
                                  img: ' ',
                                ),
                            separatorBuilder: (context, index) => Divider(
                                thickness: .25,
                                color: AppColors.neutral,
                                indent: 30,
                                endIndent: 30),
                            itemCount: context
                                .read<SavedCubit>()
                                .savedJobsModel
                                .dataList
                                .length),
                      )
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.h,
                          ),
                          Image.asset(
                            AppAssets.savedIcon,
                            width: 50.w,
                            height: 30.h,
                          ),
                          DefaultText(
                            text: AppStrings.nothingSaved,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          DefaultText(
                            text: AppStrings.pressIcon,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ));
      },
    );
  }
}
