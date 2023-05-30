part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupChangeVisibilityState extends SignupState {}
class SignupChangeColorState extends SignupState {}
class SignupChangeInterestColorState extends SignupState {}
class SignupLoadingState extends SignupState {}
class SignupSuccessState extends SignupState {}
class SignupSuccessSaveToFireStoreState extends SignupState {}
class SignupErrorState extends SignupState {}
class SignupSaveToFireStoreErrorState extends SignupState {}
class SignupPutInterestedWorkDataSuccessState extends SignupState {}
