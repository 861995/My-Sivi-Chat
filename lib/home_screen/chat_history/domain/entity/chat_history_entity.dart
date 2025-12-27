class ChatHistoryEntity {
  final String userName;
  final String lastSeen;
  final String lastMsg;
  final int unOpenedMsgCount;
  ChatHistoryEntity({
    required this.userName,
    required this.lastSeen,
    required this.lastMsg,
    required this.unOpenedMsgCount,
  });

  factory ChatHistoryEntity.placeHolder() {
    return ChatHistoryEntity(
      userName: "ram prakash",
      lastSeen: "2025-12-25 14:29:00",
      unOpenedMsgCount: 2,
      lastMsg: "hello there?",
    );
  }
}
