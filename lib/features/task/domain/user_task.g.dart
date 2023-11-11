// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTaskImpl _$$UserTaskImplFromJson(Map<String, dynamic> json) =>
    _$UserTaskImpl(
      id: json['id'] as int,
      userID: json['userID'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      reward: json['reward'] as int,
      status: json['status'] as int,
    );

Map<String, dynamic> _$$UserTaskImplToJson(_$UserTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'title': instance.title,
      'description': instance.description,
      'reward': instance.reward,
      'status': instance.status,
    };
