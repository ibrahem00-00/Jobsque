import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/view_model/main/saved/saved_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../utilities/app_assets.dart';
import '../../utilities/app_colors.dart';
import '../screens/main/apply_job/apply_job_screen.dart';
import 'default_text.dart';

// ignore: must_be_immutable
class RecentJobItem extends StatefulWidget {
  RecentJobItem(
      {Key? key,
      required this.img,
      required this.name,
      required this.location,
      required this.salary,
      required this.compName,
      required this.jobTimeType,
      required this.jobType,
      required this.jobSkill,
      required this.id,
      })
      : super(key: key);
  String img;
  String salary;
  String name;
  String location;
  String compName;
  String jobTimeType;
  String jobType;
  String jobSkill;
  dynamic id;

  @override
  State<RecentJobItem> createState() => _RecentJobItemState();
}

class _RecentJobItemState extends State<RecentJobItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ApplyJobScreen(jobId: widget.id),));
      },
      child: Container(
        height: 14.h,
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    child:
                    // widget.img == 'null'
                    //     ?
                    ImageIcon(AssetImage(AppAssets.smsIcon))
                       // : Image.network(widget.img)
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
                        color:AppColors.neutral,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      SizedBox(height: .5.h,),
                      Row(
                        children: [
                          DefaultText(
                            text: widget.compName,
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
                            text: widget.location.length >25? 'Cairo , Egypt':widget.location,
                            color: AppColors.neutral,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  width: 9.h,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                    context.read<SavedCubit>().addSavedJob(job_id: widget.id.toString());
                  },
                  child: ImageIcon(
                    AssetImage(
                      selected
                          ? AppAssets.archiveMinusBlueIcon
                          : AppAssets.archiveMinusIcon,
                    ),
                    size: 30,
                    color: selected ? AppColors.primaryColor : Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 4.h,
                        width: 21.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondaryColor),
                        child: DefaultText(
                          text: widget.jobTimeType,
                          color: AppColors.neutral,
                          fontSize: 9.sp,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 4.h,
                        width: 21.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondaryColor),
                        child: DefaultText(
                          text: widget.jobType,
                          color: AppColors.neutral,
                          fontSize: 9.sp,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 4.h,
                        width: 21.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondaryColor),
                        child: DefaultText(
                          text: widget.jobSkill,
                          color: AppColors.neutral,
                          fontSize: 9.sp,
                        ),
                      ),
                      // SizedBox(
                      //   width: 10.w,
                      // ),
                      Row(
                        children: [
                          DefaultText(
                            text: widget.salary,
                            color: AppColors.homeSalaryColor,
                            fontSize: 12.sp,
                          ),
                          DefaultText(
                            text: '/Month',
                            color: AppColors.neutral,
                            fontSize: 10.sp,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
