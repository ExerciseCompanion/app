// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetImpl _$$PetImplFromJson(Map<String, dynamic> json) => _$PetImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      maxHealth: json['maxHealth'] as int,
      maxHunger: json['maxHunger'] as int,
      maxExp: json['maxExp'] as int,
      asset: json['asset'] as String,
    );

Map<String, dynamic> _$$PetImplToJson(_$PetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'maxHealth': instance.maxHealth,
      'maxHunger': instance.maxHunger,
      'maxExp': instance.maxExp,
      'asset': instance.asset,
    };
