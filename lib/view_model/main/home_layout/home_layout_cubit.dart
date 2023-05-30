import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../view/screens/main/applied_screen.dart';
import '../../../view/screens/main/home_screen.dart';
import '../../../view/screens/main/messages_screen.dart';
import '../../../view/screens/main/profile/profile_screen.dart';
import '../../../view/screens/main/saved_screen.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  int currentIndex=0;
  List<Widget>screens=const [
    HomeScreen(),
    MessagesScreen(),
    AppliedScreen(),
    SavedScreen(),
    ProfileScreen()
  ];



  void changeIndex(int index){
    currentIndex=index;
    emit(HomeLayoutChangeBottomNavigationBarState());
  }
}
