import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/view_model/main/apply_job/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../view_model/main/home_layout/home_layout_cubit.dart';
import '../../widgets/applied_screen_item.dart';
import '../../widgets/default_app_bar.dart';
import '../../widgets/default_text.dart';

class AppliedScreen extends StatelessWidget {
  const AppliedScreen({Key? key}) : super(key: key);

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
                leading: BackButton(onPressed: (){
                  context.read<HomeLayoutCubit>().changeIndex(0);
                },color: AppColors.neutral),
                centerTitle: true,
                title: DefaultText(
                  text: AppStrings.appliedJob,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              preferredSize: Size.fromHeight(50)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3.h,),
              Center(
                child: ToggleSwitch(
                  changeOnTap: true,
                  minWidth: 45.w,
                  cornerRadius: 22.0,
                  fontSize: 14,
                  minHeight: 6.h,
                  activeBgColor: [AppColors.primaryColorDark],
                  //activeBgColors: [[AppColors.primaryColor], [AppColors.primaryColor]],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Color(0xffF4F4F5),
                  inactiveFgColor: Color(0xff6B7280),
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: [
                    AppStrings.active,
                    AppStrings.rejected,
                  ],
                  radiusStyle: true,
                  onToggle: (index) {
                    // context.read<ApplyJobCubit>().changeIndex(index);
                    print('switched to: $index');
                  },
                ),
              ),
              SizedBox(height: 3.h,),
              Container(
                padding: EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                height: 4.h,
                width: double.infinity,
                decoration:
                BoxDecoration(color: Color(0xffE5E7EB)),
                child: DefaultText(
                  text:
                  context.read<ApplyJobCubit>().appliedModelList.length.toString(),
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        AppliedScreenItem(
                            location:context.read<ApplyJobCubit>().appliedModelList[index].location.toString(),
                            name:context.read<ApplyJobCubit>().appliedModelList[index].name.toString(),
                            compName:context.read<ApplyJobCubit>().appliedModelList[index].comp_name.toString(),
                            jobTimeType:context.read<ApplyJobCubit>().appliedModelList[index].job_time_type.toString(),
                            jobType:context.read<ApplyJobCubit>().appliedModelList[index].job_type.toString()
                        ),
                    separatorBuilder: (context, index) =>
                        Divider(indent: 16, endIndent: 16, thickness: .5),
                    itemCount: context.read<ApplyJobCubit>().appliedModelList.length),
              )

            ],
          ),
        );
      },
    );
  }
}
