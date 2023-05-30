import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/app_colors.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:graduation/view_model/database/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_assets.dart';
import '../../../utilities/app_strings.dart';
import '../../../view_model/main/home/home_cubit.dart';
import '../../widgets/default_text_form_field.dart';
import '../../widgets/recent_job_item.dart';
import '../../widgets/suggested_job_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // JobsModel.dataList.clear();
    // SuggestedJobsModel.dataList.clear();
    // context.read<HomeCubit>().showSuggestedJobs();
    // context.read<HomeCubit>().showJobs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            text: 'Hi, ${CacheHelper.get(key: 'name')}👋',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          DefaultText(
                            text: AppStrings.createABetterFuture,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey.shade300)),
                        child: ImageIcon(
                          AssetImage(AppAssets.bellIcon),
                          color: AppColors.neutral,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultFormField(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.searchScreenRoute);
                    },
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: AppColors.neutral,
                      size: 25,
                    ),
                    inputBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    hintText: AppStrings.search,
                    controller: searchController,
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: AppStrings.suggestedJob,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: DefaultText(
                            text: AppStrings.viewAll,
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                  SizedBox(height: 27.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 5.w,),
                        itemCount: context.read<HomeCubit>().suggestedJobsModel.dataList.length,
                        itemBuilder: (context, index) =>
                            SuggestedJobItem(
                              id: context.read<HomeCubit>().suggestedJobsModel.dataList[index].id,
                              jobSkill:context.read<HomeCubit>().suggestedJobsModel.dataList[index].job_skill.toString() ,
                              jobType:context.read<HomeCubit>().suggestedJobsModel.dataList[index].job_type.toString() ,
                              jobTimeType: context.read<HomeCubit>().suggestedJobsModel.dataList[index].job_time_type.toString(),
                              compName:context.read<HomeCubit>().suggestedJobsModel.dataList[index].comp_name.toString() ,
                              img: context.read<HomeCubit>().suggestedJobsModel.dataList[index].image.toString(),
                              name: context.read<HomeCubit>().suggestedJobsModel.dataList[index].name.toString(),
                              index
                                  : index,
                              location
                                  : context.read<HomeCubit>().suggestedJobsModel.dataList[index].location.toString(),
                              salary
                                  : context.read<HomeCubit>().suggestedJobsModel.dataList[index].salary.toString(),),

                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: AppStrings.recentJob,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: DefaultText(
                            text: AppStrings.viewAll,
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 27.h,
                    child: ListView.separated(
                      itemCount: context.read<HomeCubit>().jobsModel.dataList.length,
                      itemBuilder: (context, index) =>
                          RecentJobItem(
                            id: context.read<HomeCubit>().jobsModel.dataList[index].id,
                            jobType: context.read<HomeCubit>().jobsModel.dataList[index].job_type.toString(),
                            jobSkill: context.read<HomeCubit>().jobsModel.dataList[index].job_skill.toString(),
                            jobTimeType: context.read<HomeCubit>().jobsModel.dataList[index].job_time_type.toString(),
                            compName:context.read<HomeCubit>().jobsModel.dataList[index].comp_name.toString() ,
                            img: context.read<HomeCubit>().jobsModel.dataList[index].image.toString(),
                            name:context.read<HomeCubit>().jobsModel.dataList[index].name.toString(),
                            location: context.read<HomeCubit>().jobsModel.dataList[index].location.toString(),
                            salary: context.read<HomeCubit>().jobsModel.dataList[index].salary.toString(),),
                      separatorBuilder: (context, index) =>
                          Divider(thickness: .5,),

                    ),
                  )
                ],
              );
            },
          ),
        ));
  }
}
