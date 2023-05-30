part of 'chats_cubit.dart';

@immutable
abstract class ChatsState {}

class ChatsInitial extends ChatsState {}


class SentMessageLoadingState extends ChatsState {}
class SentMessageSuccessState extends ChatsState {}
class SentMessageErrorState extends ChatsState {}


class GetMessageLoadingState extends ChatsState {}
class GetMessageSuccessState extends ChatsState {
  ChatsModel chatsModel ;
  GetMessageSuccessState({required this.chatsModel});
}
class GetMessageErrorState extends ChatsState {}
