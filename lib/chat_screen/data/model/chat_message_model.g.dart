// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      postId: (json['postId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      time: json['time'] as String?,
      body: json['body'] as String,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'time': instance.time,
      'body': instance.body,
    };
