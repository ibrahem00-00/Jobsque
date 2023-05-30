import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/app_assets.dart';
import 'package:graduation/view_model/main/profile/profile_cubit.dart';

import '../../../../model/language_screen_model/language_screen_model.dart';
import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/language_screen_item.dart';

class LanguageScreen extends StatefulWidget {
  LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<LanguageScreenModel> items = [
    LanguageScreenModel(
      img: AppAssets.englandIcon,
      txt: AppStrings.English,
      isSelected: false,
    ),
    LanguageScreenModel(
      img: AppAssets.indonesia2Icon,
      txt: AppStrings.Indonesia,
      isSelected: false,
    ),
    LanguageScreenModel(
      img: AppAssets.SaudiArabiaIcon,
      txt: AppStrings.Arabic,
      isSelected: false,
    ),
    LanguageScreenModel(
      img: AppAssets.China1Icon,
      txt: AppStrings.Chinese,
      isSelected: false,
    ),
    LanguageScreenModel(
      img: AppAssets.NetherlandsIcon,
      txt: AppStrings.Dutch,
      isSelected: false,
    ),
    LanguageScreenModel(
      img: AppAssets.FranceIcon,
      txt: AppStrings.French,
      isSelected: false,
    ),
    LanguageScreenModel(
      img: AppAssets.GermanyIcon,
      txt: AppStrings.German,
      isSelected: false,
    ),
    LanguageScreenModel(
      img: AppAssets.JapanIcon,
      txt: AppStrings.Japanese,
      isSelected: false,
    ),
    LanguageScreenModel(
      img: AppAssets.SouthKoreaIcon,
      txt: AppStrings.Korean,
      isSelected: false,
    ),
    LanguageScreenModel(
      img: AppAssets.PortugalIcon,
      txt: AppStrings.Portuguese,
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.Language,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(thickness: .5, endIndent: 16, indent: 16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<ProfileCubit>().changeLanguageColor(index);
                    context.read<ProfileCubit>().changeLanguage(context.read<ProfileCubit>().items[index].txt);
                    },
                  child: LanguageScreenItem(
                      img: context.read<ProfileCubit>().items[index].img,
                      txt: context.read<ProfileCubit>().items[index].txt,
                      isSelected: context.read<ProfileCubit>().items[index].isSelected),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
