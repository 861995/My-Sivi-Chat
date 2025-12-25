import '../entity/chat_history_entity.dart';

abstract class ChatHistoryRepository {
  Future<List<ChatHistoryEntity>> fetchChatHistory();
}
