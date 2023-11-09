// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      currency: json['currency'] as int,
      mainPetID: json['mainPetID'] as int,
      backdropAsset: json['backdropAsset'] as String,
      purchasedItemsIDs: (json['purchasedItemsIDs'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      petInventoryIDs: (json['petInventoryIDs'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      accessoryInventoryIDs: (json['accessoryInventoryIDs'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'currency': instance.currency,
      'mainPetID': instance.mainPetID,
      'backdropAsset': instance.backdropAsset,
      'purchasedItemsIDs': instance.purchasedItemsIDs,
      'petInventoryIDs': instance.petInventoryIDs,
      'accessoryInventoryIDs': instance.accessoryInventoryIDs,
    };
