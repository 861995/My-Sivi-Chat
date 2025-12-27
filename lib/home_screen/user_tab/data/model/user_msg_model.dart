import 'package:json_annotation/json_annotation.dart';
import 'package:my_sivi_chat/core/extension/string_extension.dart';
import 'package:my_sivi_chat/home_screen/user_tab/domain/entity/user_msg_entity.dart';
part 'user_msg_model.g.dart';

@JsonSerializable()
class UserMsgModel {
  @JsonKey(name: "userId")
  final int userId;
  @JsonKey(name: "userLastMsg")
  final String userLastMsg;
  @JsonKey(name: "userName")
  final String userName;
  @JsonKey(name: "body")
  final String? body;
  @JsonKey(name: "lastSeen")
  final String? lastSeen;

  UserMsgModel({
    required this.userId,
    required this.userLastMsg,
    required this.userName,
    this.body,
    this.lastSeen,
  });

  factory UserMsgModel.fromJson(Map<String, dynamic> json) =>
      _$UserMsgModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserMsgModelToJson(this);
  UserMsgEntity toEntity() {
    return UserMsgEntity(
      userName: userName,
      isOnline: lastSeen!.isOnline,
      lastSeen: lastSeen ?? '',
    );
  }
}
