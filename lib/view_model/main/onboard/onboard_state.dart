part of 'onboard_cubit.dart';

@immutable
abstract class OnboardState {}

class OnboardInitial extends OnboardState {}
class OnboardChangeIndex extends OnboardState {}
class OnboardSaveInfo extends OnboardState {}
