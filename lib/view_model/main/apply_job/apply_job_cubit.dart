import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:graduation/view_model/main/home/home_cubit.dart';

import '../../../model/applied_model/applied_model.dart';
import '../../../model/job_details_model/job_details_model.dart';
import '../../../model/work_type_screen_model/work_type_screen_model.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/end_points.dart';
import '../../database/local/cache_helper.dart';
import '../../database/remote/dio_helper.dart';

part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit() : super(ApplyJobInitial());
  int currentIndex = 0;
  JobDetailsModel jobDetailsModel = JobDetailsModel();
  List<WorkTypeScreenModel> itemList = [
    WorkTypeScreenModel(
      txt: AppStrings.seniorUXDesigner,
      isSelected: false,
    ),
    WorkTypeScreenModel(
      txt: AppStrings.seniorUIDesigner,
      isSelected: false,
    ),
    WorkTypeScreenModel(
      txt: AppStrings.graphikDesigner,
      isSelected: false,
    ),
    WorkTypeScreenModel(
      txt: AppStrings.frontEndDeveloper,
      isSelected: false,
    ),
  ];

  changeIndex(index) {
    currentIndex = index;
    emit(ApplyJobFChangeIndexState());
  }

  changeSelection(index) {
    for (int i = 0; i < itemList.length; i++) {
      if (i == index) {
        itemList[i].isSelected = true;
      } else {
        itemList[i].isSelected = false;
      }
    }
    emit(ApplyJobFChangeSelectionState());
  }

  Future showDetailsJobs({dynamic jobID, required BuildContext context}) async {
    emit(ShowDetailsLoadingState());
    print('false');
    DioHelper.getData(url: JobsEndPoint, token: CacheHelper.get(key: 'token'))
        .then((value) {
      for (int i = 0;
          i < context.read<HomeCubit>().suggestedJobsModel.dataList.length;
          i++) {
        if (value.data['data'][i]['id'] == jobID) {
          print(value.data['data'][i]['id']);
          jobDetailsModel =
              JobDetailsModel.fromJson(json: value.data['data'][i]);
          emit(ShowDetailsSuccessState(
              jobsDetailsModel:
                  JobDetailsModel.fromJson(json: value.data['data'][i])));
          print(jobDetailsModel.name);
        }
      }
    }).catchError((onError) {
      print(onError);
      emit(ShowDetailsErrorState());
    });
  }

  String? filePath;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    File file;
    if (result != null) {
      file = File(result.files.single.path!);
      filePath = file.path;
    }
  }

  Future applyJob(
      {required String email,
      required String name,
      required String phone,
      required String work_type,
      required String other_file,
      required String job_id,
      required String user_id,
      required context}) async {
    emit(ApplyJobLoadingState());

    FormData data = FormData.fromMap({
      "email": email,
      "name": name,
      "mobile": phone,
      // 'cv_file': await MultipartFile.fromFile(
      //   filePath!,
      // ),
      "work_type": work_type,
      "other_file": other_file,
      "job_id": job_id,
      "user_id": user_id,
    });
    DioHelper.postData(
            url: applyJopEndPoint,
            token: CacheHelper.get(key: 'token'),
            data: data)
        .then((value) {
      Navigator.popAndPushNamed(
          context, AppRoutes.ApplyJobDataSubmittedScreenRoute);
      var old = CacheHelper.get(key: '${CacheHelper.get(key: 'email')}').toString()=='null'?'':CacheHelper.get(key: '${CacheHelper.get(key: 'email')}').toString();
      CacheHelper.put(key: '${CacheHelper.get(key: 'email')}', value: old + job_id + '%');
      print(value.data);
      emit(ApplyJobSuccessState());
    }).catchError((error) {
      print(error);
      emit(ApplyJobErrorState());
    });
  }

  List<AppliedModel> appliedModelList = [];
  List<AppliedModel> appliedModelList1= [];

  addToApplyScreen(BuildContext context) {
    appliedModelList.clear();
    print(CacheHelper.get(key: '${CacheHelper.get(key: 'email')}'));

    DioHelper.getData(
            url: SuggestedJobsEndPoint + CacheHelper.get(key: 'id').toString(),
            token: CacheHelper.get(key: 'token'))
        .then((value) {
      List indexes = [];
      if (CacheHelper.get(key: "${CacheHelper.get(key: 'email')}").toString() != 'null') {
        indexes = CacheHelper.get(key: "${CacheHelper.get(key: 'email')}").toString().split("%");

        List ids = indexes.toSet().toList();
        print(ids);
        for (int i = 0;
            i < context.read<HomeCubit>().suggestedJobsModel.dataList.length;
            i++) {
          if (ids.contains(value.data['data'][i]['id'].toString())) {
            print(value.data['data'][i]['id']);

            appliedModelList
                .add(AppliedModel.fromJson(json: value.data['data'][i]));
            print(appliedModelList[0].name);
            // appliedModel =
            //     AppliedModel.fromJson(json: value.data);
            //print(appliedModel.dataList[i].name);
          }
        }
      }
    });
  }
}
