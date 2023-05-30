import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/search_model/search_model.dart';
import '../../../utilities/end_points.dart';
import '../../database/local/cache_helper.dart';
import '../../database/remote/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future searchJobs(String searchValue) async {
    SearchModel.dataList.clear();
    emit(SearchLoadingState());
    DioHelper.getData(
      queryParameters: {
        'name':searchValue
      },
        url: SearchEndPoint,
        token: CacheHelper.get(key:'token'))
        .then((value) {
      emit(SearchSuccessState(
          searchModel: SearchModel.fromJson(value.data)));
      print(value.data);
    }).catchError((onError) {
      print(onError);
      emit(SearchErrorState());
    });
  }




  Future searchFilterJobs({
    required String name,
    required String location,
    required String salary,
  }) async {
    SearchModel.dataList.clear();
    emit(SearchFilterLoadingState());
    DioHelper.getData(
      queryParameters: {
        'name':name,
        'location':location,
        'salary':salary,
      },
        url: SearchFilterEndPoint,
        token: CacheHelper.get(key:'token'))
        .then((value) {
      emit(SearchFilterSuccessState(
          searchFilterModel: SearchModel.fromJson(value.data)));
      print(value.data);
    }).catchError((onError) {
      print(onError);
      emit(SearchFilterErrorState());
    });
  }
}
