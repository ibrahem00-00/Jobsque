import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:graduation/view_model/database/local/cache_helper.dart';

import '../../../model/chats_model/chats_model.dart';
import '../../../utilities/end_points.dart';
import '../../database/remote/dio_helper.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());

  ChatsModel chatsModel = ChatsModel();

  void userSentMessage({

    required String message,

  }) {
    emit(SentMessageLoadingState());
    DioHelper.postData(

        url:UserSentMessageEndPoint,
        token: CacheHelper.get(key: "token"),
        data: {
          "massage":message,
          "user_id":CacheHelper.get(key: "id"),
          "comp_id":'1'
        }).then((value) {

        getAllMessages();
        emit(SentMessageSuccessState());

    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(SentMessageErrorState());
    });
  }



  void getAllMessages() {
    emit(GetMessageLoadingState());
    ChatsModel.dataList.clear();
    DioHelper.getData(
      queryParameters: {
        "user_id":CacheHelper.get(key: "id").toString(),
        "comp_id":'1'
      },
      url:ChatsEndPoint,
      token: CacheHelper.get(key:"token"),
    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetMessageSuccessState(chatsModel: ChatsModel.fromJson(value.data)));
        print(ChatsModel.dataList[0].massage.toString());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetMessageErrorState());
    });
  }

}
