import 'package:dio/dio.dart';

import '../../domain/entity/chat_message_entity.dart';
import '../../domain/repository/chat_message_repo.dart';
import '../datasource/receiver_remote_ds.dart';
import '../datasource/sender_local_ds.dart';

class ChatMessageRepositoryImpl implements ChatMessageRepository {
  final SenderLocalDataSource senderLocalDs;
  final ReceiverMsgRemoteDataSource receiverMsgRemoteDataSource;

  ChatMessageRepositoryImpl({
    required this.senderLocalDs,
    required this.receiverMsgRemoteDataSource,
  });

  @override
  Future<List<ChatMessageEntity>> fetchChatMessage(
    CancelToken? cancelToken,
  ) async {
    final receiverMsg = await receiverMsgRemoteDataSource.fetchRecieverMsg(
      cancelToken,
    );
    final senderData = await senderLocalDs.fetchSenderMsg();

    final combinedList = [
      ...receiverMsg.map((e) => e.toEntity(false)),
      ...senderData.map((e) => e.toEntity(true)),
    ];

    combinedList.sort((a, b) => a.msgTime.compareTo(b.msgTime));

    return combinedList;
  }
}
