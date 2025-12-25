import '../../domain/entity/chat_history_entity.dart';
import '../../domain/repository/chat_history_repo.dart';
import '../data_source/chat_history_local_ds.dart';

class ChatHistoryRepositoryImpl implements ChatHistoryRepository {
  final ChatHistoryLocalDataSource dataSource;

  ChatHistoryRepositoryImpl({required this.dataSource});

  @override
  Future<List<ChatHistoryEntity>> fetchChatHistory() async {
    final jsonResponse = await dataSource.fetchChatHistory();
    return jsonResponse.map((e) => e.toEntity()).toList();
  }
}
