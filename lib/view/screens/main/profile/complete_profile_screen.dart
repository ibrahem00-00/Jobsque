import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../../view_model/main/complete_profile/complete_profile_cubit.dart';
import '../../../widgets/complete_profile_screen_item.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_text.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
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
                  text: AppStrings.completeProfile,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              preferredSize: Size.fromHeight(50)),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Center(
                  child: CircularPercentIndicator(
                    animation: true,
                    animationDuration: 500,
                    //widgetIndicator: Text("100%"),
                    backgroundColor: Color(0xffE5E7EB),
                    radius: 60.0,
                    lineWidth: 10.0,
                    percent: context.read<CompleteProfileCubit>().percentage,
                    center: DefaultText(
                        text: context
                        .read<CompleteProfileCubit>()
                        .percentage == 0 ? '0%' :context
                        .read<CompleteProfileCubit>()
                        .percentage == 0.25 ?'25%':context
                        .read<CompleteProfileCubit>()
                        .percentage == 0.5 ? '50%':context
                            .read<CompleteProfileCubit>()
                            .percentage == 0.75 ? '75%':'100%',
                      color: AppColors.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    progressColor: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                DefaultText(
                  text: AppStrings.completed,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultText(
                  text: AppStrings.completeYourProfile,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade500,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 2.h,),
                    itemBuilder: (context, index) =>
                        CompleteProfileScreenItem(
                          route:context.read<CompleteProfileCubit>().items[index].route ,
                          mainText:context.read<CompleteProfileCubit>().items[index].mainText ,
                          text:context.read<CompleteProfileCubit>().items[index].text ,
                          isCompleted:context.read<CompleteProfileCubit>().items[index].isCompleted ,
                        ), itemCount: context.read<CompleteProfileCubit>().items.length,),
                )

              ],
            ),
          ),
        );
      },
    );
  }
}
