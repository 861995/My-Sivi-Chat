import '../entity/chat_message_entity.dart';
import '../repository/chat_message_repo.dart';

class GetChatMessageUseCase {
  final ChatMessageRepository repository;

  GetChatMessageUseCase(this.repository);

  Future<List<ChatMessageEntity>> fetchChatMessage() {
    return repository.fetchChatMessage();
  }
}
