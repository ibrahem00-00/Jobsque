import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  bool passwordVisible = true;
  bool newPasswordVisible = true;
  bool color = false;
  bool matchColor = false;

  changeVisibility(){
    passwordVisible = !passwordVisible;
    emit(ResetPasswordChangeVisibilityState());
  }
  changeVisibility1(){
    newPasswordVisible = !newPasswordVisible;
    emit(NewPasswordChangeVisibilityState());
  }
  changeColor({String? value,String? matchValue}) {
    if(value!.length <8){
      color =false;
    }else{
      color=true;
    }
    if(value == matchValue){
      matchColor =true;
    }else{
      matchColor =false;
    }
    emit(ResetPasswordChangeColorState());
  }
}
