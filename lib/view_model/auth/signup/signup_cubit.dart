
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduation/utilities/routes.dart';
import 'package:graduation/view_model/database/local/cache_helper.dart';

import '../../../model/user_model/user_model.dart';
import '../../../utilities/end_points.dart';
import '../../database/remote/dio_helper.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  bool passwordVisible = true;
  bool isClicked = false;
  bool color = false;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserModel registerUser = UserModel();
  int? userID;
  changeVisibility(){
    passwordVisible = !passwordVisible;
    emit(SignupChangeVisibilityState());
  }
  changeColor(String value){
    if(value.length <8){
      color =false;
    }else{
      color=true;
    }
    emit(SignupChangeColorState());
    //color = !color;
  }
  changeInterestColor(){
    isClicked =!isClicked;
    emit(SignupChangeInterestColorState());
  }

  Future postRegister({
    required String name,
    required String email,
    required String password,
    required context
  }) async {
    emit(SignupLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "name": name,
      "email": email,
      "password": password,
    }).then((value) {
      Navigator.popAndPushNamed(context, AppRoutes.signUpInterest);
      userID =value.data["data"]["id"];
      CacheHelper.put(key: 'email', value: email);
      CacheHelper.put(key: "token", value: value.data['token']);
      emit(SignupSuccessState());
    }).catchError((error){
      if (kDebugMode) {
        print(error);
      }
      emit(SignupErrorState());
    });
  }
  
  
  Future putInterestedWorkData({String? interestedWork, String? offlinePlace,String? remotePlace,required context})async{
    DioHelper.putData(url:updateProfileEndPoint+userID.toString() , data: {
      "intersted_work":interestedWork,
      "offline_place":offlinePlace,
      "remote_place":remotePlace,
    },
      token:CacheHelper.get(key: "token")

    ).then((value) {
      emit(SignupPutInterestedWorkDataSuccessState());
      //Navigator.popAndPushNamed(context, AppRoutes.signUpPickLocationScreenRoute);
    });

}




















  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  registerByEmailAndPassword(
      String email, String password, String name, context) async {
    emit(SignupLoadingState());
    UserCredential credential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    registerUser.name = name;
    registerUser.password = password;
    registerUser.email = email;
    registerUser.id = credential.user!.uid;
    fireStore
        .collection("user")
        .doc(registerUser.id)
        .set(registerUser.toJson())
        .then((value) {
      Navigator.popAndPushNamed(context, AppRoutes.signUpInterest);
      emit(SignupSuccessSaveToFireStoreState());
    });
  }
}
