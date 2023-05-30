import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:graduation/view_model/main/search/search_cubit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../model/search_model/search_model.dart';
import '../../../utilities/app_assets.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text_form_field.dart';
import '../../widgets/filter_item.dart';
import '../../widgets/search_item.dart';
import '../../widgets/search_row.dart';
import '../../widgets/sheet_filter_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  var jobTitleController = TextEditingController();
  var locationController = TextEditingController();
  var salaryController = TextEditingController();

  @override
  void initState() {
    SearchModel.dataList.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List recent = [
      "Junior UI Designer",
      "Junior UX Designer",
      "Product Designer",
      "Project Manager",
      "UI/UX Designer",
      "Front-End Developer"
    ];
    List popular = [
      "UI/UX Designer",
      "Project Manager",
      "Product Designer",
      "UX Designer",
      "Front-End Developer"
    ];
    // List<SearchModel> searchResult = [
    //   SearchModel(
    //       img: "assets/profile.png",
    //       salary: '\$12K',
    //       location: 'Zoom • United States',
    //       name: 'Product Designer'),
    //   SearchModel(
    //       img: "assets/profile.png",
    //       salary: '\$12K',
    //       location: 'Zoom • United States',
    //       name: 'Product Designer'),
    //   SearchModel(
    //       img: "assets/profile.png",
    //       salary: '\$12K',
    //       location: 'Zoom • United States',
    //       name: 'Product Designer'),
    //   SearchModel(
    //       img: "assets/profile.png",
    //       salary: '\$12K',
    //       location: 'Zoom • United States',
    //       name: 'Product Designer'),
    //   SearchModel(
    //       img: "assets/profile.png",
    //       salary: '\$12K',
    //       location: 'Zoom • United States',
    //       name: 'Product Designer'),
    // ];

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: state is SearchErrorState?
              ? SingleChildScrollView(
                child: Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(context, AppRoutes.homeLayoutScreenRoute);
                            },
                            icon: const Icon(Icons.arrow_back_outlined),
                          ),
                          SizedBox(
                            width: 80.w,
                            child: DefaultFormField(

                              suffixIcon: ImageIcon(AssetImage(AppAssets.closeIcon),color: AppColors.neutral,size: 25,),
                              onChanged: (searchValue) {
                                context
                                    .read<SearchCubit>()
                                    .searchJobs(searchValue);
                              },
                              autofocus: true,
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: AppColors.neutral,
                                size: 25,
                              ),
                              inputBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:AppColors.neutral),
                                  borderRadius: BorderRadius.circular(25)),
                              hintText: AppStrings.search,
                              controller: searchController,
                              keyboardType: TextInputType.text,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  showMaterialModalBottomSheet(
                                    barrierColor: Colors.grey.shade700,
                                    context: context,
                                    builder: (context) => SingleChildScrollView(
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 16),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.white,
                                        ),
                                        height: 90.h,
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                BackButton(
                                                  color: AppColors.neutral,
                                                ),
                                                //SizedBox(width: 23.w,),
                                                DefaultText(
                                                  text: AppStrings.setFilter,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                //SizedBox(width: 19.w,),
                                                DefaultText(
                                                  text: AppStrings.reset,
                                                  color: AppColors.primaryColor,
                                                  fontSize: 16,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            DefaultText(
                                              text: AppStrings.jobTittle,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            DefaultFormField(
                                              prefixIcon: ImageIcon(
                                                  AssetImage(
                                                      AppAssets.briefcaseIcon),
                                                  size: 25,
                                                  color: AppColors.neutral),
                                              inputBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: AppColors.neutral),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              controller: jobTitleController,
                                              keyboardType: TextInputType.text,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            DefaultText(
                                              text: AppStrings.location,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            DefaultFormField(
                                              prefixIcon: ImageIcon(
                                                  AssetImage(
                                                      AppAssets.locationIcon),
                                                  size: 25,
                                                  color: AppColors.neutral),
                                              inputBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: AppColors.neutral),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              controller: locationController,
                                              keyboardType: TextInputType.text,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            DefaultText(
                                              text: AppStrings.salary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            DefaultFormField(
                                              prefixIcon: ImageIcon(
                                                  AssetImage(
                                                      AppAssets.dollarIcon),
                                                  size: 25,
                                                  color: AppColors.neutral),
                                              inputBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: AppColors.neutral),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              controller: salaryController,
                                              keyboardType: TextInputType.text,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            DefaultText(
                                              text: AppStrings.jobTittle,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SheetFilterItem(
                                                  text: AppStrings.fullTime,
                                                ),
                                                SheetFilterItem(
                                                  text: AppStrings.remote,
                                                ),
                                                SheetFilterItem(
                                                  text: AppStrings.contract,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SheetFilterItem(
                                                  text: AppStrings.partTime,
                                                ),
                                                SheetFilterItem(
                                                  text: AppStrings.onsite,
                                                ),
                                                SheetFilterItem(
                                                  text: AppStrings.internship,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            DefaultButton(
                                              onPressed: () {
                                                context
                                                    .read<SearchCubit>()
                                                    .searchFilterJobs(
                                                        location:
                                                            locationController
                                                                .text,
                                                        name: jobTitleController
                                                            .text,
                                                        salary: salaryController
                                                            .text);
                                              },
                                              text: AppStrings.showResult,
                                              textColor: Colors.white,
                                              width: double.infinity,
                                              height: 7.h,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              radius: 3.5.h,
                                              background: AppColors.primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: ImageIcon(AssetImage(AppAssets.filterIcon),
                                    size: 33)),
                            FilterItem(
                              text: AppStrings.remote,
                            ),
                            FilterItem(
                              text: AppStrings.fullName,
                            ),
                            FilterItem(
                              text: AppStrings.postDate,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 70.h,
                          child: Column(
                        children: [
                          Image.asset(AppAssets.searchErrorIcon),
                          SizedBox(
                            height: 2.h,
                          ),
                          DefaultText(
                            text: AppStrings.searchNotFound,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: DefaultText(
                              textAlign: TextAlign.center,
                              text: AppStrings.trySearchingWithDifferentKeywords,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
              )
              : SearchModel.dataList.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.popAndPushNamed(context, AppRoutes.homeLayoutScreenRoute);
                              },
                              icon: const Icon(Icons.arrow_back_outlined),
                            ),
                            SizedBox(
                              width: 80.w,
                              child: DefaultFormField(
                                onChanged: (searchValue) {
                                  context
                                      .read<SearchCubit>()
                                      .searchJobs(searchValue);
                                },
                                autofocus: true,
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: AppColors.neutral,
                                  size: 25,
                                ),
                                inputBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color:AppColors.neutral),
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: AppStrings.search,
                                controller: searchController,
                                keyboardType: TextInputType.text,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 6.h,
                          color: const Color(0xaaE5E7EB),
                          child: DefaultText(
                            text: AppStrings.recentSearches,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount: recent.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SearchRow(
                                  prefixIcon: AppAssets.clockIcon,
                                  title: recent[index],
                                  suffixIcon: AppAssets.closeCircleIcon,
                                  suffixColor: AppColors.danger,
                                ),
                                SizedBox(
                                  height: 2.h,
                                )
                              ],
                            );
                          },
                        )),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 6.h,
                          color: const Color(0xaaE5E7EB),
                          child: DefaultText(
                            text: AppStrings.popularSearches,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount: popular.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SearchRow(
                                  prefixIcon: AppAssets.searchStatusIcon,
                                  title: popular[index],
                                  suffixIcon: AppAssets.arrowRightIcon,
                                  suffixColor: AppColors.primaryColor,
                                ),
                                SizedBox(
                                  height: 2.h,
                                )
                              ],
                            );
                          },
                        )),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.popAndPushNamed(context, AppRoutes.homeLayoutScreenRoute);
                              },
                              icon: const Icon(Icons.arrow_back_outlined),
                            ),
                            SizedBox(
                              width: 80.w,
                              child: DefaultFormField(
                                onChanged: (searchValue) {
                                  context
                                      .read<SearchCubit>()
                                      .searchJobs(searchValue);
                                },
                                autofocus: true,
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: AppColors.neutral,
                                  size: 25,
                                ),
                                inputBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color:AppColors.neutral),
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: AppStrings.search,
                                controller: searchController,
                                keyboardType: TextInputType.text,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    showMaterialModalBottomSheet(
                                      barrierColor: Colors.grey.shade700,
                                      context: context,
                                      builder: (context) =>
                                          SingleChildScrollView(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors.white,
                                          ),
                                          height: 90.h,
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  BackButton(
                                                    color: AppColors.neutral,
                                                  ),
                                                  //SizedBox(width: 23.w,),
                                                  DefaultText(
                                                    text: AppStrings.setFilter,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  //SizedBox(width: 19.w,),
                                                  DefaultText(
                                                    text: AppStrings.reset,
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 16,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              DefaultText(
                                                text: AppStrings.jobTittle,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              DefaultFormField(
                                                prefixIcon: ImageIcon(
                                                    AssetImage(AppAssets
                                                        .briefcaseIcon),
                                                    size: 25,
                                                    color: AppColors.neutral),
                                                inputBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.neutral),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                controller: jobTitleController,
                                                keyboardType:
                                                    TextInputType.text,
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              DefaultText(
                                                text: AppStrings.location,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              DefaultFormField(
                                                prefixIcon: ImageIcon(
                                                    AssetImage(
                                                        AppAssets.locationIcon),
                                                    size: 25,
                                                    color: AppColors.neutral),
                                                inputBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.neutral),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                controller: locationController,
                                                keyboardType:
                                                    TextInputType.text,
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              DefaultText(
                                                text: AppStrings.salary,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              DefaultFormField(
                                                prefixIcon: ImageIcon(
                                                    AssetImage(
                                                        AppAssets.dollarIcon),
                                                    size: 25,
                                                    color: AppColors.neutral),
                                                inputBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            AppColors.neutral),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                controller: salaryController,
                                                keyboardType:
                                                    TextInputType.text,
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              DefaultText(
                                                text: AppStrings.jobTittle,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SheetFilterItem(
                                                    text: AppStrings.fullTime,
                                                  ),
                                                  SheetFilterItem(
                                                    text: AppStrings.remote,
                                                  ),
                                                  SheetFilterItem(
                                                    text: AppStrings.contract,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SheetFilterItem(
                                                    text: AppStrings.partTime,
                                                  ),
                                                  SheetFilterItem(
                                                    text: AppStrings.onsite,
                                                  ),
                                                  SheetFilterItem(
                                                    text: AppStrings.internship,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              DefaultButton(
                                                onPressed: () {
                                                  context
                                                      .read<SearchCubit>()
                                                      .searchFilterJobs(
                                                          location:
                                                              locationController
                                                                  .text,
                                                          name:
                                                              jobTitleController
                                                                  .text,
                                                          salary:
                                                              salaryController
                                                                  .text);
                                                },
                                                text: AppStrings.showResult,
                                                textColor: Colors.white,
                                                width: double.infinity,
                                                height: 7.h,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                radius: 3.5.h,
                                                background:
                                                    AppColors.primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: ImageIcon(
                                      AssetImage(AppAssets.filterIcon),
                                      size: 33)),
                              FilterItem(
                                text: AppStrings.remote,
                              ),
                              FilterItem(
                                text: AppStrings.fullName,
                              ),
                              FilterItem(
                                text: AppStrings.postDate,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 6.h,
                          color: const Color(0xaaE5E7EB),
                          child: DefaultText(
                            text: AppStrings.featuring +
                                SearchModel.dataList.length.toString() +
                                AppStrings.jobs,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                            child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(thickness: .5, endIndent: 25, indent: 25),
                          itemCount: SearchModel.dataList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: SearchItem(
                                    jobTimeType: SearchModel
                                        .dataList[index].job_time_type
                                        .toString(),
                                    compName: SearchModel
                                        .dataList[index].comp_name
                                        .toString(),
                                    jobType: SearchModel
                                        .dataList[index].job_type
                                        .toString(),
                                    img: SearchModel.dataList[index].image
                                        .toString(),
                                    location: SearchModel
                                        .dataList[index].location
                                        .toString(),
                                    name: SearchModel.dataList[index].name
                                        .toString(),
                                    salary: SearchModel.dataList[index].salary
                                        .toString(),
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
                      ],
                    ),
        );
      },
    );
  }
}
