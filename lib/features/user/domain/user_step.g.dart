// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStepImpl _$$UserStepImplFromJson(Map<String, dynamic> json) =>
    _$UserStepImpl(
      id: json['id'] as int,
      userID: json['userID'] as int,
      date: json['date'] as String,
      steps: json['steps'] as int,
    );

Map<String, dynamic> _$$UserStepImplToJson(_$UserStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'date': instance.date,
      'steps': instance.steps,
    };
