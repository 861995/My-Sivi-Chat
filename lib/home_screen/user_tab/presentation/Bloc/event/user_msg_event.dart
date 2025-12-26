abstract class UserMsgEvent {
  const UserMsgEvent();
}

class FetchUserMessages extends UserMsgEvent {
  const FetchUserMessages();
}

class AddUserMsg extends UserMsgEvent {
  final String userName;

  const AddUserMsg(this.userName);
}
