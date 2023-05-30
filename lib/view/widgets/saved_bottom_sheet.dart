import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_strings.dart';
import '../../view_model/main/saved/saved_cubit.dart';
import '../screens/main/apply_job/apply_job_bio_data.dart';

class SavedBottomSheet extends StatelessWidget {
  SavedBottomSheet({Key? key, required this.id}) : super(key: key);

  dynamic id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 2.h,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ApplyJobBioDataScreen(jobId:id),));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.neutral)),
              child: Row(
                children: [
                  ImageIcon(AssetImage(AppAssets.applyIcon)),
                  SizedBox(width: 2.w),
                  Expanded(
                      child: DefaultText(
                    text: AppStrings.applyJob,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
                  ImageIcon(AssetImage(AppAssets.applyIcon))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.neutral)),
            child: Row(
              children: [
                ImageIcon(AssetImage(AppAssets.applyIcon)),
                SizedBox(width: 2.w),
                Expanded(
                    child: DefaultText(
                      text: AppStrings.share,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                ImageIcon(AssetImage(AppAssets.applyIcon))
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          InkWell(
            onTap: () {
              context.read<SavedCubit>().deleteSavedJobs(job_id: id);
              Navigator.pop(context);
              context.read<SavedCubit>().showSavedJobs();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.neutral)),
              child: Row(
                children: [
                  ImageIcon(AssetImage(AppAssets.applyIcon)),
                  SizedBox(width: 2.w),
                  Expanded(
                      child: DefaultText(
                        text: AppStrings.cancelSave,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  ImageIcon(AssetImage(AppAssets.applyIcon))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          )
        ],
      ),
    );
  }
}
