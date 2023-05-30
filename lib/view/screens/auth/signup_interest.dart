import 'package:flutter/material.dart';
import 'package:graduation/utilities/app_colors.dart';
import 'package:graduation/utilities/app_strings.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:graduation/view/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../model/interest_work_model/interest_work_model.dart';
import '../../../utilities/app_assets.dart';
import '../../widgets/default_button.dart';
import '../../widgets/interested_work_item.dart';

class SignUpInterest extends StatelessWidget {
  const SignUpInterest({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    List<LocationPickModel> items = [
      LocationPickModel(text: AppStrings.uIUXDesigner, img: AppAssets.uxIcon,value: 'ux'),
      LocationPickModel(text: AppStrings.ilustratorDesigner, img: AppAssets.designerIcon,value: 'designer'),
      LocationPickModel(text: AppStrings.developer, img: AppAssets.developerIcon,value: 'developer'),
      LocationPickModel(text: AppStrings.management, img: AppAssets.managementIcon,value: 'management'),
      LocationPickModel(text: AppStrings.informationTechnology, img: AppAssets.itIcon,value: 'it'),
      LocationPickModel(text: AppStrings.researchAndAnalytics, img: AppAssets.researchIcon,value: 'research'),
    ];
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 3.h,),
                 DefaultText(text: AppStrings.type,fontSize: 24.sp,fontWeight: FontWeight.w500,color: AppColors.neutral,maxLines: 2,),
                SizedBox(
                  height: 1.h,
                ),
                const DefaultText(text: AppStrings.whatYouInterestedIn,fontWeight: FontWeight.w400,fontSize: 16,color: AppColors.neutral,maxLines: 2,),
                SizedBox(height: 3.h,),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 15,
                    mainAxisExtent: 130
                  ),
                  itemBuilder: (context, index) {
                    return InterestedWorkItem(img:items[index].img ,txt:items[index].text,value:items[index].value,);
                  },
                ),
                SizedBox(height: 6.h,),
                DefaultButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUpPickLocationScreenRoute);
                  },
                  text: AppStrings.next,
                  textColor: Colors.white,
                  width: double.infinity,
                  height: 7.h,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  radius: 3.5.h,
                  background: AppColors.primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
