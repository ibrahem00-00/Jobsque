import 'package:flutter/material.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../model/location_pick_model/location_pick_model.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/routes.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/pick_location_item.dart';

class SignUpPickLocationScreen extends StatefulWidget {
  SignUpPickLocationScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPickLocationScreen> createState() =>
      _SignUpPickLocationScreenState();
}

class _SignUpPickLocationScreenState extends State<SignUpPickLocationScreen> {
  List<LocationPickModel> items = [
    LocationPickModel(text: AppStrings.unitedStates, img: AppAssets.unitedStatesIcon,value: 'us'),
    LocationPickModel(text: AppStrings.malaysia, img: AppAssets.malaysiaIcon,value: 'Philippine'),
    LocationPickModel(text: AppStrings.singapore, img: AppAssets.singaporeIcon,value: 'China'),
    LocationPickModel(text: AppStrings.indonesia, img: AppAssets.indonesiaIcon,value: 'us'),
    LocationPickModel(text: AppStrings.philiphines, img: AppAssets.philiphinesIcon,value: 'us'),
    LocationPickModel(text: AppStrings.poland, img: AppAssets.polandIcon,value: 'us'),
    LocationPickModel(text: AppStrings.india, img: AppAssets.indiaIcon,value: 'us'),
    LocationPickModel(text: AppStrings.vietnam, img: AppAssets.vietnamIcon,value: 'us'),
    LocationPickModel(text: AppStrings.china, img:AppAssets.chinaIcon,value: 'us'),
    LocationPickModel(text: AppStrings.canada, img: AppAssets.canadaIcon,value: 'us'),
    LocationPickModel(text: AppStrings.saudiArabia, img:AppAssets.saudiArabiaIcon,value: 'us'),
    LocationPickModel(text: AppStrings.argentina, img: AppAssets.argentinaIcon,value: 'us'),
    LocationPickModel(text: AppStrings.brazil, img:AppAssets.brazilIcon,value: 'us'),
  ];

  bool isClicked= false;
  bool remote= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    DefaultText(
                      text: AppStrings.preferredLocation,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff111827),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const DefaultText(
                      text: AppStrings.workLocationYouWant,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff737379),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    ToggleSwitch(
                      minWidth: 45.w,
                      cornerRadius: 22.0,
                      fontSize: 14,
                      minHeight: 6.h,
                      activeBgColor: [AppColors.primaryColorDark],
                      //activeBgColors: [[AppColors.primaryColor], [AppColors.primaryColor]],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Color(0xffF4F4F5),
                      inactiveFgColor: Color(0xff6B7280),
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: [AppStrings.workFromOffice, AppStrings.remoteWork],
                      radiusStyle: true,
                      onToggle: (index) {
                        remote =!remote;
                        print(remote);
                        print('switched to: $index');
                      },
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const DefaultText(
                      text: AppStrings.selectCountry,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff737379),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 43.h,
                      child: Wrap(
                        //direction: Axis.horizontal,
                        spacing: 10, // space between items
                        children: items
                            .map((e) => PickLocationItem(text:e.text ,img:e.img,value: e.value, remote: remote,))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              DefaultButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.setupScreenRoute);
                },
                text: AppStrings.next,
                textColor: Colors.white,
                width: double.infinity,
                height: 7.h,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                radius: 3.5.h,
                background: AppColors.primaryColor,
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
