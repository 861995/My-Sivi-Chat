import 'package:my_sivi_chat/home_screen/user_tab/domain/entity/user_msg_entity.dart';

abstract class UserMsgRepository {
  Future<List<UserMsgEntity>> fetchUserMessages();
}
