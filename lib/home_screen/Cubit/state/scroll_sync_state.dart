class ScrollSyncState {
  final double chatHistoryOffset;
  final double userMsgOffset;

  const ScrollSyncState({
    this.chatHistoryOffset = 0.0,
    this.userMsgOffset = 0.0,
  });

  ScrollSyncState copyWith({double? chatHistoryOffset, double? userMsgOffset}) {
    return ScrollSyncState(
      chatHistoryOffset: chatHistoryOffset ?? this.chatHistoryOffset,
      userMsgOffset: userMsgOffset ?? this.userMsgOffset,
    );
  }
}
