import '../entity/chat_message_entity.dart';

abstract class ChatMessageRepository {
  Future<List<ChatMessageEntity>> fetchChatMessage();
}
