import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:graduation/utilities/routes.dart';

import '../../../model/complete_profile_model/complete_profile_model.dart';
import '../../../model/edit_profile_model/edit_profile_model.dart';
import '../../../model/portfolio_model/portfolio_model.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/end_points.dart';
import '../../database/local/cache_helper.dart';
import '../../database/remote/dio_helper.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileInitial());
  double percentage = CacheHelper.get(key: 'percentage').toString()=='null'?0.0:CacheHelper.get(key: 'percentage');

  changePercentage() {
    if(percentage<1){
      percentage = percentage + .25;
    }
    CacheHelper.put(key: 'percentage', value: percentage);
    emit(ChangePercentageState());
  }

  List<CompleteProfileModel> items = [
    CompleteProfileModel(
        mainText: AppStrings.personalDetails,
        text: AppStrings.fullNameEmail,
        isCompleted: true,
        route: AppRoutes.personalDetailsScreenRoute),
    CompleteProfileModel(
        mainText: AppStrings.education,
        text: AppStrings.enterYourEducational,
        isCompleted: false,
        route: AppRoutes.educationScreenRoute),
    CompleteProfileModel(
        mainText: AppStrings.experience,
        text: AppStrings.enterYourWorkExperience,
        isCompleted: false,
        route: AppRoutes.experienceScreenRoute),
    CompleteProfileModel(
        mainText: AppStrings.portfolioScreen,
        text: AppStrings.createYourPortfolio,
        isCompleted: false,
        route: AppRoutes.completePortfolioScreenRoute),
  ];

  checkIfCompleted(index) {
    emit(CheckIfCompletedState());
  }

  EditProfileBioAddressMobileModel editProfileBioAddressMobileModel =
      EditProfileBioAddressMobileModel();

   editProfileBioAddressMobile({
    String? bio,
    String? address,
    String? mobile,
  }) {
    emit(EditProfileLoadingState());
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
      emit(EditProfileSuccessState());
      if(CacheHelper.get(key: 'edit').toString()=='null'){
        changePercentage();
        CacheHelper.put(key: 'edit', value: 0);
      }

    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(EditProfileErrorState());
    });
  }

  Future addEducation(
      {required String universty,
      required String title,
      required String start,
      required String end,}) async {
    emit(EducationLoadingState());
    DioHelper.postData(
            url: EducationEndPoint,
            data: {
              "universty": universty,
              "title": title,
              "start": start,
              "end": end,
              "user_id": CacheHelper.get(key: 'id').toString(),
            },
            token: CacheHelper.get(key: 'token'))
        .then((value) {
      if(CacheHelper.get(key: 'education').toString()=='null'){
        changePercentage();
        CacheHelper.put(key: 'education', value: 0);
      }
      emit(EducationSuccessState());
    }).catchError((error) {
      print(error);
      emit(EducationErrorState());
    });
  }

  PortfolioModel portfolioModel = PortfolioModel();

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
        if(CacheHelper.get(key: 'portfolio').toString()=='null'){
          changePercentage();
          CacheHelper.put(key: 'portfolio', value: 0);
        }
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

  Future addExperience(
      {required String postion,
      required String type_work,
      required String comp_name,
      required String location,
      required String start,}) async {
    emit(EducationLoadingState());
    DioHelper.postData(
            url: ExperienceEndPoint,
            data: {
              "postion": postion,
              "type_work": type_work,
              "comp_name": comp_name,
              "location": location,
              "start": start,
              "user_id": CacheHelper.get(key: 'id').toString(),
            },
            token: CacheHelper.get(key: 'token'))
        .then((value) {
      if(CacheHelper.get(key: 'Experience').toString()=='null'){
        changePercentage();
        CacheHelper.put(key: 'Experience', value: 0);
      }
      emit(EducationSuccessState());
    }).catchError((error) {
      print(error);
      emit(EducationErrorState());
    });
  }
}
