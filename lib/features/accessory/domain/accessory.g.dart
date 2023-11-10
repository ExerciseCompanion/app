// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccessoryImpl _$$AccessoryImplFromJson(Map<String, dynamic> json) =>
    _$AccessoryImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      asset: json['asset'] as String,
    );

Map<String, dynamic> _$$AccessoryImplToJson(_$AccessoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'asset': instance.asset,
    };
