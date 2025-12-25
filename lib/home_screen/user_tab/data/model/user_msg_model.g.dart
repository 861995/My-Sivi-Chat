// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_msg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMsgModel _$UserMsgModelFromJson(Map<String, dynamic> json) => UserMsgModel(
  userId: (json['userId'] as num).toInt(),
  userLastMsg: json['userLastMsg'] as String,
  userName: json['userName'] as String,
  body: json['body'] as String?,
  lastSeen: json['lastSeen'] as String?,
);

Map<String, dynamic> _$UserMsgModelToJson(UserMsgModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userLastMsg': instance.userLastMsg,
      'userName': instance.userName,
      'body': instance.body,
      'lastSeen': instance.lastSeen,
    };
