import '../entity/user_msg_entity.dart';
import '../repository/user_msg_repo.dart';

class GetUserMsgUseCase {
  final UserMsgRepository repository;

  GetUserMsgUseCase(this.repository);

  Future<List<UserMsgEntity>> fetchUserMsg() {
    return repository.fetchUserMessages();
  }
}
