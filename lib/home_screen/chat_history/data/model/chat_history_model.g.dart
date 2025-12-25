// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatHistoryModel _$ChatHistoryModelFromJson(Map<String, dynamic> json) =>
    ChatHistoryModel(
      userId: (json['userId'] as num).toInt(),
      userLastMsg: json['userLastMsg'] as String,
      userName: json['userName'] as String,
      body: json['body'] as String?,
      unOpenedCount: (json['unOpenedCount'] as num).toInt(),
      lastSeen: json['lastSeen'] as String?,
    );

Map<String, dynamic> _$ChatHistoryModelToJson(ChatHistoryModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userLastMsg': instance.userLastMsg,
      'userName': instance.userName,
      'body': instance.body,
      'unOpenedCount': instance.unOpenedCount,
      'lastSeen': instance.lastSeen,
    };
