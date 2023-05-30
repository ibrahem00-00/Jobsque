part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeShowSuggestedJobsLoadingState extends HomeState {}
class HomeShowSuggestedJobsSuccessState extends HomeState {
  SuggestedJobsModel suggestedJobsModel;
HomeShowSuggestedJobsSuccessState({required this.suggestedJobsModel});

}
class HomeShowSuggestedJobsErrorState extends HomeState {}
class HomeShowJobsLoadingState extends HomeState {}
class HomeShowJobsSuccessState extends HomeState {
  JobsModel jobsModel;
  HomeShowJobsSuccessState({required this.jobsModel});
}
class HomeShowJobsErrorState extends HomeState {}



class SelectedItemState extends HomeState {}
