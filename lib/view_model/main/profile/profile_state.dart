part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}


class changeLanguageColorS extends ProfileState {}
class changeLanguageColorF extends ProfileState {}


class PicImageSuccessState extends ProfileState {}
class PicImageSuccessStorageState extends ProfileState {}
class PicImageSuccessDownloadStorageState extends ProfileState {}
class UpdateProfileSuccessState extends ProfileState {}
class UpdateProfileErrorState extends ProfileState {}
class GetProfileSuccessState extends ProfileState {}
class GetProfileErrorState extends ProfileState {}



class LoadingState extends ProfileState {}
class EditProfileBioAddressMobileSuccessState extends ProfileState {


}
class EditProfileBioAddressMobileFailedState extends ProfileState {}


class AddPortfolioLoadingState extends ProfileState {}
class AddPortfolioSuccessState extends ProfileState {}
class AddPortfolioErrorState extends ProfileState {}

class GetPortfolioLoadingState extends ProfileState {}
class GetPortfolioSuccessState extends ProfileState {}
class GetPortfolioErrorState extends ProfileState {}

class DeletePortfolioLoadingState extends ProfileState {}
class DeletePortfolioSuccessState extends ProfileState {}
class DeletePortfolioErrorState extends ProfileState {}

class ChangeLanguageLoadingState extends ProfileState {}
class ChangeLanguageSuccessState extends ProfileState {}
class ChangeLanguageErrorState extends ProfileState {}




