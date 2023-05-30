import 'package:flutter/material.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_assets.dart';
import '../../utilities/app_colors.dart';
import 'default_text.dart';

// ignore: must_be_immutable
class SearchItem extends StatefulWidget {
  SearchItem(
      {Key? key,
      required this.img,
      required this.name,
      required this.location,
      required this.salary,
      required this.compName,
      required this.jobTimeType,
      required this.jobType,
      })
      : super(key: key);
  String img;
  String salary;
  String name;
  String location;
  String compName;
  String jobTimeType;
  String jobType;
  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return  Container(
      //padding: EdgeInsets.symmetric(horizontal: 16),
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
                child: widget.img == 'null'
                    ? ImageIcon(AssetImage(AppAssets.smsIcon))
                    : Image.network(widget.img)
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
                          text: widget.location,
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
                width: 10.h,
              ),
              InkWell(
                onTap: (){
                  setState((){selected=!selected;});
                  Navigator.pushNamed(context, AppRoutes.applyJobScreenRoute);
                },
                child: ImageIcon(
                  AssetImage(
                    selected?AppAssets.archiveMinusBlueIcon:
                    AppAssets.archiveMinusIcon,
                  ),
                  size: 30,
                  color:selected? AppColors.primaryColor:Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 4.h,
                width: 23.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.secondaryColor),
                child: DefaultText(
                  text: widget.jobTimeType,
                  color: AppColors.primaryColor,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 4.w,),
              Container(
                alignment: Alignment.center,
                height: 4.h,
                width: 22.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.secondaryColor),
                child: DefaultText(
                  text: widget.jobType,
                  color: AppColors.primaryColor,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Row(
                children: [
                  DefaultText(
                    text: widget.salary,
                    color: AppColors.homeSalaryColor,
                    fontSize: 16,
                  ),
                  DefaultText(
                    text: '/Month',
                    color: AppColors.neutral,
                    fontSize: 12,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}