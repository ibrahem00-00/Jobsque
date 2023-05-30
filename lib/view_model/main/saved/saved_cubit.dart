import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../model/saved_model/saved_model.dart';
import '../../../utilities/end_points.dart';
import '../../database/local/cache_helper.dart';
import '../../database/remote/dio_helper.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());
  ShowSavedJobsModel savedJobsModel = ShowSavedJobsModel();

  Future showSavedJobs() async {
    //ShowSavedJobsModel.dataList.clear();

    emit(SavedLoadingState());
    DioHelper.getData(
            url: SavedJopEndPoint + CacheHelper.get(key: 'id'),
            token: CacheHelper.get(key: 'token'))
        .then((value) {
      savedJobsModel = ShowSavedJobsModel.fromJson(value.data);
      emit(SavedSuccessState(
          savedJobsModel: ShowSavedJobsModel.fromJson(value.data)));
      print(value.data);
    }).catchError((onError) {
      print(onError);
      emit(SavedErrorState());
    });
  }

  Future addSavedJob({required String job_id}) async {
    emit(AddSavedLoadingState());
    print(job_id);
    DioHelper.postData(
            url: AddSavedJopEndPoint,
            data: {'user_id': CacheHelper.get(key: 'id'), 'job_id': job_id},
            token: CacheHelper.get(key: 'token'))
        .then((value) {
      emit(AddSavedSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(AddSavedErrorState());
    });
  }

  void deleteSavedJobs({required String job_id}) {
    emit(DeleteSavedLoadingState());
    DioHelper.deleteData(
      url: SavedJopEndPoint + job_id,
      token: CacheHelper.get(key: "token"),
    ).then((value) {
      // showSavedJobs();
      emit(DeleteSavedSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(DeleteSavedErrorState());
    });
  }
}
