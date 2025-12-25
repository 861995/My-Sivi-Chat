import '../../domain/entity/user_msg_entity.dart';
import '../../domain/repository/user_msg_repo.dart';
import '../data_source/user_msg_local_ds.dart';

class UserMsgRepositoryImpl implements UserMsgRepository {
  final UserMsgLocalDataSource dataSource;

  UserMsgRepositoryImpl({required this.dataSource});

  @override
  Future<List<UserMsgEntity>> fetchUserMessages() async {
    final jsonResponse = await dataSource.fetchUserMsg();
    return jsonResponse.map((e) => e.toEntity()).toList();
  }
}
