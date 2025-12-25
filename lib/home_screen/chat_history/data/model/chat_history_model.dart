import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/chat_history_entity.dart';
part 'chat_history_model.g.dart';

@JsonSerializable()
class ChatHistoryModel {
  @JsonKey(name: "userId")
  final int userId;
  @JsonKey(name: "userLastMsg")
  final String userLastMsg;
  @JsonKey(name: "userName")
  final String userName;
  @JsonKey(name: "body")
  final String? body;
  @JsonKey(name: "unOpenedCount")
  final int unOpenedCount;
  @JsonKey(name: "lastSeen")
  final String? lastSeen;

  ChatHistoryModel({
    required this.userId,
    required this.userLastMsg,
    required this.userName,
    this.body,
    required this.unOpenedCount,
    this.lastSeen,
  });

  factory ChatHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatHistoryModelToJson(this);
  ChatHistoryEntity toEntity() {
    return ChatHistoryEntity(
      userName: userName,
      lastSeen: lastSeen ?? '',
      lastMsg: userLastMsg,
      unOpenedMsgCount: unOpenedCount,
    );
  }
}
