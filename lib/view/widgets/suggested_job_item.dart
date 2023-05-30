import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:graduation/utilities/app_colors.dart';
import 'package:graduation/view/screens/main/apply_job/apply_job_screen.dart';
import 'package:graduation/view/widgets/default_button.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:graduation/view_model/main/home/home_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_strings.dart';
import '../../view_model/main/saved/saved_cubit.dart';

// ignore: must_be_immutable
class SuggestedJobItem extends StatefulWidget {
  SuggestedJobItem({
    Key? key,
    required this.img,
    required this.salary,
    required this.location,
    required this.name,
    required this.index,
    required this.compName,
    required this.jobTimeType,
    required this.jobType,
    required this.jobSkill,
    required this.id,
  }) : super(key: key);
  String img;
  String salary;
  String name;
  String location;
  String compName;
  String jobTimeType;
  String jobType;
  String jobSkill;
  int index;
  dynamic id;

  @override
  State<SuggestedJobItem> createState() => _SuggestedJobItemState();
}

class _SuggestedJobItemState extends State<SuggestedJobItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 27.h,
      width: 90.w,
      decoration: BoxDecoration(
          color: (widget.index == 0)
              ? AppColors.primaryColorDark
              : Color(0xffF4F4F5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 5.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                  ),
                  child:
                      //widget.img == 'null' ?
                      ImageIcon(AssetImage(AppAssets.smsIcon))
                  //:Image.network(widget.img)
                  ),
              SizedBox(
                width: 3.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultText(
                      text: widget.name,
                      color: (widget.index == 0)
                          ? Colors.white
                          : AppColors.neutral,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    Row(
                      children: [
                        DefaultText(
                          text: widget.compName,
                          color: (widget.index == 0)
                              ? Colors.white
                              : AppColors.neutral,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        Container(
                          height: 4,
                          width: 4,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (widget.index == 0)
                                  ? Colors.white
                                  : AppColors.neutral),
                        ),
                        DefaultText(
                          text: widget.location.length > 25
                              ? 'Cairo, Egypt'
                              : widget.location,
                          color: (widget.index == 0)
                              ? Colors.white
                              : AppColors.neutral,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 12.h,
              // ),
              InkWell(
                onTap: () {
                  context.read<HomeCubit>().selectedItem();
                  context
                      .read<SavedCubit>()
                      .addSavedJob(job_id: widget.id.toString());
                },
                child: ImageIcon(
                  AssetImage(
                    context.read<HomeCubit>().selected
                        ? AppAssets.archiveMinusBlueIcon
                        : AppAssets.archiveMinusIcon,
                  ),
                  size: 30,
                  color: (widget.index == 0)
                      ? Colors.white
                      : context.read<HomeCubit>().selected
                          ? AppColors.primaryColor
                          : Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 4.h,
                width: 25.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (widget.index == 0)
                        ? Colors.white.withOpacity(0.14)
                        : AppColors.secondaryColor),
                child: DefaultText(
                  text: widget.jobTimeType,
                  color: (widget.index == 0) ? Colors.white : AppColors.neutral,
                  fontSize: 12,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 4.h,
                width: 25.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (widget.index == 0)
                        ? Colors.white.withOpacity(0.14)
                        : AppColors.secondaryColor),
                child: DefaultText(
                  text: widget.jobType,
                  color: (widget.index == 0) ? Colors.white : AppColors.neutral,
                  fontSize: 8.sp,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 4.h,
                width: 25.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (widget.index == 0)
                        ? Colors.white.withOpacity(0.14)
                        : AppColors.secondaryColor),
                child: DefaultText(
                  text: widget.jobSkill,
                  color: (widget.index == 0) ? Colors.white : AppColors.neutral,
                  fontSize: 8.sp,
                  //maxLines: 2,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              DefaultText(
                text: widget.salary,
                color: (widget.index == 0) ? Colors.white : AppColors.neutral,
                fontSize: 20,
              ),
              DefaultText(
                text: '/Month',
                color: (widget.index == 0) ? Colors.white : AppColors.neutral,
                fontSize: 12,
              ),
              SizedBox(
                width: 20.w,
              ),
              DefaultButton(
                onPressed: () {


                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApplyJobScreen(jobId: widget.id),
                      ));
                },
                text: AppStrings.applyNow,
                background: AppColors.primaryColor,
                width: 28.w,
                height: 4.5.h,
                fontSize: 12,
                radius: 15,
              )
            ],
          )
        ],
      ),
    );
  }
}
