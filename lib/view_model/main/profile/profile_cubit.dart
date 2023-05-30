import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:graduation/utilities/end_points.dart';
import 'package:graduation/view_model/database/local/cache_helper.dart';

import '../../../model/edit_profile_model/edit_profile_model.dart';
import '../../../model/language_screen_model/language_screen_model.dart';
import '../../../model/portfolio_model/portfolio_model.dart';
import '../../../utilities/app_assets.dart';
import '../../../utilities/app_strings.dart';
import '../../database/remote/dio_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  EditProfileBioAddressMobileModel editProfileBioAddressMobileModel =
      EditProfileBioAddressMobileModel();
  PortfolioModel portfolioModel = PortfolioModel();

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

  changeLanguageColor(index) {
    for (int i = 0; i < items.length; i++) {
      if (i == index) {
        items[i].isSelected = true;
        emit(changeLanguageColorS());
      } else {
        items[i].isSelected = false;
        emit(changeLanguageColorF());
      }
    }
  }

  void editProfileBioAddressMobile({
    String? bio,
    String? address,
    String? mobile,
  }) {
    emit(LoadingState());
    DioHelper.putData(
      data: {
        "bio": bio,
        "address": address,
        "mobile": "01001623288",
      },
      url: EditProfileEndPoint + CacheHelper.get(key: "id"),
      token: CacheHelper.get(key: "token"),
    ).then((value) {
      editProfileBioAddressMobileModel =
          EditProfileBioAddressMobileModel.fromJson(json: value.data['data']);
      emit(EditProfileBioAddressMobileSuccessState());
      getPortfolio();
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(EditProfileBioAddressMobileFailedState());
    });
  }

  addPortfolio() async {
    emit(AddPortfolioLoadingState());
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    File file;
    String filePath;
    String filename;
    if (result != null) {
      file = File(result.files.single.path ?? ' ');
      filePath = file.path;
      filename = file.path.split('/').last;

      FormData data = FormData.fromMap({
        'cv_file': await MultipartFile.fromFile(
          filePath,
        ),
        'name': filename
      });
      DioHelper.postData(
              url: AddPortfolioEndPoint + CacheHelper.get(key: "id"),
              token: CacheHelper.get(key: 'token'),
              data: data)
          .then((value) {
        getPortfolio();
        emit(AddPortfolioSuccessState());
        print(value.data);
      }).catchError((onError) {
        emit(AddPortfolioErrorState());
      });
    }
  }

  getPortfolio() async {
    emit(GetPortfolioLoadingState());
    DioHelper.getData(
      url: AddPortfolioEndPoint + CacheHelper.get(key: "id"),
      token: CacheHelper.get(key: 'token'),
    ).then((value) {
      portfolioModel = PortfolioModel.fromJson(value.data);
      emit(GetPortfolioSuccessState());
      print(value.data);
    }).catchError((onError) {
      print(onError);
      emit(GetPortfolioErrorState());
    });
  }

  deletePortfolio() async {
    emit(DeletePortfolioLoadingState());
    DioHelper.deleteData(
      url: AddPortfolioEndPoint + CacheHelper.get(key: "id"),
      token: CacheHelper.get(key: 'token'),
    ).then((value) {
      getPortfolio();
      emit(DeletePortfolioSuccessState());
      print(value.data);
    }).catchError((onError) {
      print(onError);
      emit(DeletePortfolioErrorState());
    });
  }

  changeLanguage(language) async {
    emit(ChangeLanguageLoadingState());
    DioHelper.putData(
      data: {'language': language},
      url: ChangeLanguageEndPoint + CacheHelper.get(key: "id"),
      token: CacheHelper.get(key: 'token'),
    ).then((value) {
      emit(ChangeLanguageSuccessState());
      print(value.data);
    }).catchError((onError) {
      print(onError);
      emit(ChangeLanguageErrorState());
    });
  }
}
