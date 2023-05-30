part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}
class ResetPasswordChangeVisibilityState extends ResetPasswordState {}
class NewPasswordChangeVisibilityState extends ResetPasswordState {}
class ResetPasswordChangeColorState extends ResetPasswordState {}

