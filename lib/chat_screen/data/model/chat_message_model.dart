import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/chat_message_entity.dart';
part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel {
  @JsonKey(name: "postId")
  final int postId;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "body")
  final String body;

  ChatMessageModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    this.time,
    required this.body,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
  ChatMessageEntity toEntity(bool isSender) {
    return ChatMessageEntity(
      userName: name,
      msgTime: isSender ? time ?? '' : _formatCurrentTime(),
      message: body,
      isSender: isSender,
    );
  }
}

String _formatCurrentTime() {
  final now = DateTime.now();
  final hour = now.hour > 12 ? now.hour - 12 : now.hour;
  final minute = now.minute.toString().padLeft(2, '0');
  final period = now.hour >= 12 ? 'PM' : 'AM';
  return '$hour:$minute $period';
}
