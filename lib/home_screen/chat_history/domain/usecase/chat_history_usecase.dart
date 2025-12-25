import '../entity/chat_history_entity.dart';
import '../repository/chat_history_repo.dart';

class GetChatHistoryUseCase {
  final ChatHistoryRepository repository;

  GetChatHistoryUseCase(this.repository);

  Future<List<ChatHistoryEntity>> fetchChatHistory() {
    return repository.fetchChatHistory();
  }
}
