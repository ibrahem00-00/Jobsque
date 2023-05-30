import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/view_model/main/profile/profile_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_assets.dart';
import '../../utilities/app_colors.dart';
import 'default_text.dart';

class CvItem extends StatelessWidget {
  CvItem({Key? key,required this.fileName}) : super(key: key);
  String fileName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 10.h,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.neutral, width: .25)),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: fileName,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        children: [
                          DefaultText(text: 'cv.pdf 300KB',fontWeight: FontWeight.w400,color: Colors.grey.shade500,fontSize: 10.sp,)
                        ],
                      )
                    ],
                  )

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
          GestureDetector(
            onTap: () {
              context.read<ProfileCubit>().deletePortfolio();
            },
            child: ImageIcon(
              AssetImage(AppAssets.closeIcon),
              color: AppColors.danger,
            ),
          ),
        ],
      ),
    );
  }
}
