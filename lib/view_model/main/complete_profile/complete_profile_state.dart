part of 'complete_profile_cubit.dart';

@immutable
abstract class CompleteProfileState {}

class CompleteProfileInitial extends CompleteProfileState {}
class CheckIfCompletedState extends CompleteProfileState {}
class ChangePercentageState extends CompleteProfileState {}

class EditProfileLoadingState extends CompleteProfileState {}
class EditProfileSuccessState extends CompleteProfileState {}
class EditProfileErrorState extends CompleteProfileState {}

class EducationLoadingState extends CompleteProfileState {}
class EducationSuccessState extends CompleteProfileState {}
class EducationErrorState extends CompleteProfileState {}

class AddPortfolioLoadingState extends CompleteProfileState {}
class AddPortfolioSuccessState extends CompleteProfileState {}
class AddPortfolioErrorState extends CompleteProfileState {}

class GetPortfolioLoadingState extends CompleteProfileState {}
class GetPortfolioSuccessState extends CompleteProfileState {}
class GetPortfolioErrorState extends CompleteProfileState {}

class DeletePortfolioLoadingState extends CompleteProfileState {}
class DeletePortfolioSuccessState extends CompleteProfileState {}
class DeletePortfolioErrorState extends CompleteProfileState {}

