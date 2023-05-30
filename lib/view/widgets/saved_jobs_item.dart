import 'package:flutter/material.dart';
import 'package:graduation/view/widgets/saved_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_assets.dart';
import '../../utilities/app_colors.dart';
import 'default_text.dart';

class SavedJobsItem extends StatefulWidget {
  SavedJobsItem({
    Key? key,
    required this.name,
    required this.comp_name,
    required this.location,
    required this.img,
    required this.id,
  }) : super(key: key);
  String comp_name;
  String name;
  String location;
  String img;
  String id;

  @override
  State<SavedJobsItem> createState() => _SavedJobsItemState();
}

class _SavedJobsItemState extends State<SavedJobsItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 12.h,
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
                    child: ImageIcon(AssetImage(AppAssets.smsIcon))),
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
                        color: AppColors.neutral,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: .5.h,
                      ),
                      Row(
                        children: [
                          DefaultText(
                            text: widget.comp_name,
                            color: AppColors.neutral,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          SizedBox(
                            width: .75.w,
                          ),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.neutral),
                          ),
                          SizedBox(
                            width: .75.w,
                          ),
                          DefaultText(
                            text: widget.location.length >25? 'Cairo, Egypt':widget.location,
                            color: AppColors.neutral,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
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
                    showModalBottomSheet(
                      barrierColor: Colors.black45,
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) => SavedBottomSheet(
                        id: widget.id,
                      ),
                    );
                  },
                  child: ImageIcon(
                    AssetImage(AppAssets.moreIcon),
                    size: 30,
                    color: AppColors.neutral,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  text: 'Posted 2 days ago',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage(AppAssets.clockIcon),
                      size: 20,
                      color: AppColors.success,
                    ),
                    DefaultText(
                      text: 'Be an early applicant',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
