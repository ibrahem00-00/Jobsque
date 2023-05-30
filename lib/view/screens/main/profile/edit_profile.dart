import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:graduation/view_model/main/profile/profile_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_form_field.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.editProfile,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: SingleChildScrollView(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                CircleAvatar(
                  radius: 40,
                  child: Stack(
                    children: [
                      Image.asset(AppAssets.smsIcon),
                      ImageIcon(AssetImage(AppAssets.cameraIcon))
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultText(
                  text: AppStrings.changePhoto,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: AppStrings.name,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DefaultFormField(
                        inputFocusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: AppColors.primaryColor)),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.required;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      DefaultText(
                        text: AppStrings.bio,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DefaultFormField(
                        inputFocusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: AppColors.primaryColor)),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        controller: bioController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.required;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      DefaultText(
                        text: AppStrings.address,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DefaultFormField(
                        inputFocusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: AppColors.primaryColor)),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.required;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      DefaultText(
                        text: AppStrings.noHandphone,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DefaultFormField(
                        inputFocusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: AppColors.primaryColor)),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        prefixIcon: CountryListPick(
                            theme: CountryTheme(
                              isShowFlag: true,
                              isShowTitle: false,
                              isShowCode: false,
                              isDownIcon: true,
                              showEnglishName: false,
                            ),
                            // Set default value
                            //initialSelection: '+20',
                            // or
                            initialSelection: 'US',
                            onChanged: (code) {
                              // print(code.name);
                              // print(code.code);

                              print(code?.dialCode);
                              // print(code.flagUri);
                            },
                            // Whether to allow the widget to set a custom UI overlay
                            useUiOverlay: false,
                            // Whether the country list should be wrapped in a SafeArea
                            useSafeArea: false),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.required;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DefaultButton(
                            onPressed: () {
                              context.read<ProfileCubit>()
                                  .editProfileBioAddressMobile(
                                  address: addressController.text,
                                  bio: bioController.text,
                                  mobile:phoneController.text
                              );
                            },
                            text: AppStrings.save,
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
                          )
                        ],
                      )
                    ],
                  ),
                )

              ],
            );
          },
        ),
      ),
    );
  }
}
