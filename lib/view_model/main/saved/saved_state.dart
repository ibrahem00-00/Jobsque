part of 'saved_cubit.dart';

@immutable
abstract class SavedState {}

class SavedInitial extends SavedState {}
class SavedLoadingState extends SavedState {}
class SavedSuccessState extends SavedState {
  ShowSavedJobsModel savedJobsModel;
  SavedSuccessState({required this.savedJobsModel});
}
class SavedErrorState extends SavedState {}


class AddSavedLoadingState extends SavedState {}
class AddSavedSuccessState extends SavedState {}
class AddSavedErrorState extends SavedState {}

class DeleteSavedLoadingState extends SavedState {}
class DeleteSavedSuccessState extends SavedState {}
class DeleteSavedErrorState extends SavedState {}
