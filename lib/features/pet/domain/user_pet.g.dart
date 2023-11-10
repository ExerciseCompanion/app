// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPetImpl _$$UserPetImplFromJson(Map<String, dynamic> json) =>
    _$UserPetImpl(
      id: json['id'] as int,
      userID: json['userID'] as int,
      petID: json['petID'] as int,
      accessoryID: json['accessoryID'] as int,
      health: json['health'] as int,
      hunger: json['hunger'] as int,
      exp: json['exp'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UserPetImplToJson(_$UserPetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'petID': instance.petID,
      'accessoryID': instance.accessoryID,
      'health': instance.health,
      'hunger': instance.hunger,
      'exp': instance.exp,
      'name': instance.name,
    };
