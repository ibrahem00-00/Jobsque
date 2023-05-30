import 'package:bloc/bloc.dart';
import 'package:graduation/view_model/database/local/cache_helper.dart';
import 'package:graduation/view_model/database/remote/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../../model/jobs_model/jobs_model.dart';
import '../../../model/suggested_jobs_model/suggested_jobs_model.dart';
import '../../../utilities/end_points.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  SuggestedJobsModel suggestedJobsModel = SuggestedJobsModel();
  JobsModel jobsModel = JobsModel();
  bool selected = false;

  selectedItem(){
    selected =!selected;
    emit(SelectedItemState());
  }





  Future showSuggestedJobs() async {
    emit(HomeShowSuggestedJobsLoadingState());
    DioHelper.getData(
            url: SuggestedJobsEndPoint + CacheHelper.get(key:'id').toString(),
            token: CacheHelper.get(key:'token'))
        .then((value) {
      suggestedJobsModel = SuggestedJobsModel.fromJson(value.data);
      emit(HomeShowSuggestedJobsSuccessState(
          suggestedJobsModel: SuggestedJobsModel.fromJson(value.data)));
      print(value.data);
    }).catchError((onError) {
      print(onError);
      emit(HomeShowSuggestedJobsErrorState());
    });
  }
  Future showJobs() async {
    emit(HomeShowJobsLoadingState());
    DioHelper.getData(
            url: JobsEndPoint,
            token: CacheHelper.get(key:'token'))
        .then((value) {
          jobsModel = JobsModel.fromJson(value.data);
      emit(HomeShowJobsSuccessState(
          jobsModel: JobsModel.fromJson(value.data)));
      print(value.data);
    }).catchError((onError) {
      print(onError);
      emit(HomeShowJobsErrorState());
    });
  }
}
