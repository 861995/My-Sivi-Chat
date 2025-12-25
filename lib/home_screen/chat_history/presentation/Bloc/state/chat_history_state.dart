import '../../../domain/entity/chat_history_entity.dart';

abstract class ChatHistoryState {
  const ChatHistoryState();
}

class ChatHistoryInitial extends ChatHistoryState {}

class ChatHistoryLoading extends ChatHistoryState {}

class ChatHistoryLoaded extends ChatHistoryState {
  final List<ChatHistoryEntity> chatHistory;

  const ChatHistoryLoaded(this.chatHistory);
}

class ChatHistoryError extends ChatHistoryState {
  final String message;

  const ChatHistoryError(this.message);
}
