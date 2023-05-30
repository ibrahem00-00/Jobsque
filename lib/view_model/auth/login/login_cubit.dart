import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../model/login_model/login_model.dart';
import '../../../model/user_model/user_model.dart';
import '../../../utilities/end_points.dart';
import '../../../utilities/routes.dart';
import '../../database/local/cache_helper.dart';
import '../../database/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool passwordVisible = true;
  bool isChecked = false;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserModel registerUser = UserModel();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  changeVisibility() {
    passwordVisible = !passwordVisible;
    emit(LoginChangeVisibilityState());
  }

  changeCheck() {
    isChecked = !isChecked;
    emit(LoginChangeCheckState());
  }


  Future loginPost({
    required String email,
    required String password,
    required context
  }) async {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginEndPoint, data: {
      "email": email,
      "password": password,
    }).then((value) {
        emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
        CacheHelper.put(key: 'name', value: value.data["user"]["name"]);
        CacheHelper.put(key: 'email', value: value.data["user"]["email"]);
        CacheHelper.put(key: 'id', value: value.data["user"]["id"].toString());
        CacheHelper.put(key: 'token', value: value.data["token"].toString());
        //CacheHelper.put(key: 'photoUrl', value: value.data.photoUrl.toString());
        CacheHelper.put(key: 'logged', value: "true");

        Navigator.popAndPushNamed(context, AppRoutes.homeLayoutScreenRoute);
    }).catchError((error) {
      print(error);
      emit(LoginErrorState());
    });
  }










  // loginByEmailAndPassword(String email, String password, context) async {
  //   UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
  //       email: email, password: password);
  //
  //   fireStore.collection('user').doc(credential.user!.uid).get().then((value) {
  //     registerUser =
  //         UserModel.fromJson(json: (value.data()) as Map<String, dynamic>);
  //     CacheHelper.put(key: 'name', value: registerUser.name.toString());
  //     CacheHelper.put(key: 'email', value: registerUser.email.toString());
  //     CacheHelper.put(key: 'photoUrl', value: registerUser.photoUrl.toString());
  //     CacheHelper.put(key: 'logged', value: true);
  //     emit(LoginGetFormFirebaseSuccessState(
  //         userModel: UserModel.fromJson(
  //             json: (value.data()) as Map<String, dynamic>)));
  //     Navigator.popAndPushNamed(context, AppRoutes.homeLayoutScreenRoute);
  //   }).catchError((onError) {
  //     if (kDebugMode) {
  //       print(onError);
  //     }
  //     emit(LoginGetFormFirebaseErrorState());
  //   });
  // }

  signInByGoogle() async {
    try {
      firebaseAuth.signOut();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      var user = await firebaseAuth.signInWithCredential(authCredential);

      try {
        registerUser.id = user.user!.uid;
        registerUser.name = googleSignInAccount.displayName;
        registerUser.email = googleSignInAccount.email;
        registerUser.photoUrl = googleSignInAccount.photoUrl;
        registerUser.password = googleSignInAccount.serverAuthCode;
        CacheHelper.put(key: 'name', value: registerUser.name.toString());
        CacheHelper.put(key: 'email', value: registerUser.email.toString());
        CacheHelper.put(key: 'photoUrl', value: registerUser.photoUrl.toString());
        CacheHelper.put(key: 'logged', value: 'true');
        await firebaseFirestore
            .collection('user')
            .doc(registerUser.id)
            .set(registerUser.toJson());
        //getMessage();
        // getUsers();
        // emit(SaveDataToFireStoreEmail());
      } catch (e2) {
        rethrow;
        // emit(ErrorDataToFireStoreEmail());
      }
    } catch (e) {
      rethrow;

      //emit(RegisterFailedEmail());
    }
  }
}
