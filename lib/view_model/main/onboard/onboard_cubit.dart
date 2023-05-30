import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../database/local/cache_helper.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(OnboardInitial());
  int currentIndex = 0;
  storeOnboardInfo()  {
    int isViewed = 0;
    CacheHelper.put(key: 'onBoard', value: isViewed);
    emit(OnboardSaveInfo());
  }
  changeIndex(index){
    currentIndex = index;
    emit(OnboardChangeIndex());
  }
}
