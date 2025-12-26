class ChatMessageEntity {
  final String userName;
  final String msgTime;
  final String message;
  final bool isSender;
  ChatMessageEntity({
    required this.userName,
    required this.msgTime,
    required this.message,
    required this.isSender,
  });

  factory ChatMessageEntity.placeHolder(bool isSender) {
    return ChatMessageEntity(
      userName: "ram prakash",
      msgTime: "2 min away",
      isSender: isSender,
      message:
          "hello there? yes im here for very long time and im waiting here. can you see that? please reply",
    );
  }
}
