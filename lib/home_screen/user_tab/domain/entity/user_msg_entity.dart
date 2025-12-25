class UserMsgEntity {
  final String userName;
  final bool isOnline;
  final String lastSeen;
  UserMsgEntity({
    required this.userName,
    required this.isOnline,
    required this.lastSeen,
  });

  factory UserMsgEntity.placeHolder() {
    return UserMsgEntity(
      userName: "ram prakash",
      isOnline: false,
      lastSeen: "2 min away",
    );
  }
}
