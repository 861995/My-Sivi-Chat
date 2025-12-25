import '../../../domain/entity/user_msg_entity.dart';

abstract class UserMsgState {
  const UserMsgState();
}

class UserMsgInitial extends UserMsgState {
  const UserMsgInitial();
}

class UserMsgLoading extends UserMsgState {
  const UserMsgLoading();
}

class UserMsgLoaded extends UserMsgState {
  final List<UserMsgEntity> messages;

  const UserMsgLoaded(this.messages);
}

class UserMsgError extends UserMsgState {
  final String message;

  const UserMsgError(this.message);
}
