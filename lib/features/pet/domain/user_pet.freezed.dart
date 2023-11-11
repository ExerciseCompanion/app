// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPet _$UserPetFromJson(Map<String, dynamic> json) {
  return _UserPet.fromJson(json);
}

/// @nodoc
mixin _$UserPet {
  int get id => throw _privateConstructorUsedError;
  int get userID => throw _privateConstructorUsedError;
  int get petID => throw _privateConstructorUsedError;
  int get accessoryID => throw _privateConstructorUsedError;
  int get health => throw _privateConstructorUsedError;
  int get hunger => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPetCopyWith<UserPet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPetCopyWith<$Res> {
  factory $UserPetCopyWith(UserPet value, $Res Function(UserPet) then) =
      _$UserPetCopyWithImpl<$Res, UserPet>;
  @useResult
  $Res call(
      {int id,
      int userID,
      int petID,
      int accessoryID,
      int health,
      int hunger,
      int exp,
      String name});
}

/// @nodoc
class _$UserPetCopyWithImpl<$Res, $Val extends UserPet>
    implements $UserPetCopyWith<$Res> {
  _$UserPetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userID = null,
    Object? petID = null,
    Object? accessoryID = null,
    Object? health = null,
    Object? hunger = null,
    Object? exp = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      petID: null == petID
          ? _value.petID
          : petID // ignore: cast_nullable_to_non_nullable
              as int,
      accessoryID: null == accessoryID
          ? _value.accessoryID
          : accessoryID // ignore: cast_nullable_to_non_nullable
              as int,
      health: null == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as int,
      hunger: null == hunger
          ? _value.hunger
          : hunger // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPetImplCopyWith<$Res> implements $UserPetCopyWith<$Res> {
  factory _$$UserPetImplCopyWith(
          _$UserPetImpl value, $Res Function(_$UserPetImpl) then) =
      __$$UserPetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userID,
      int petID,
      int accessoryID,
      int health,
      int hunger,
      int exp,
      String name});
}

/// @nodoc
class __$$UserPetImplCopyWithImpl<$Res>
    extends _$UserPetCopyWithImpl<$Res, _$UserPetImpl>
    implements _$$UserPetImplCopyWith<$Res> {
  __$$UserPetImplCopyWithImpl(
      _$UserPetImpl _value, $Res Function(_$UserPetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userID = null,
    Object? petID = null,
    Object? accessoryID = null,
    Object? health = null,
    Object? hunger = null,
    Object? exp = null,
    Object? name = null,
  }) {
    return _then(_$UserPetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      petID: null == petID
          ? _value.petID
          : petID // ignore: cast_nullable_to_non_nullable
              as int,
      accessoryID: null == accessoryID
          ? _value.accessoryID
          : accessoryID // ignore: cast_nullable_to_non_nullable
              as int,
      health: null == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as int,
      hunger: null == hunger
          ? _value.hunger
          : hunger // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPetImpl extends _UserPet {
  const _$UserPetImpl(
      {required this.id,
      required this.userID,
      required this.petID,
      required this.accessoryID,
      required this.health,
      required this.hunger,
      required this.exp,
      required this.name})
      : super._();

  factory _$UserPetImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPetImplFromJson(json);

  @override
  final int id;
  @override
  final int userID;
  @override
  final int petID;
  @override
  final int accessoryID;
  @override
  final int health;
  @override
  final int hunger;
  @override
  final int exp;
  @override
  final String name;

  @override
  String toString() {
    return 'UserPet(id: $id, userID: $userID, petID: $petID, accessoryID: $accessoryID, health: $health, hunger: $hunger, exp: $exp, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.petID, petID) || other.petID == petID) &&
            (identical(other.accessoryID, accessoryID) ||
                other.accessoryID == accessoryID) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.hunger, hunger) || other.hunger == hunger) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userID, petID, accessoryID, health, hunger, exp, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPetImplCopyWith<_$UserPetImpl> get copyWith =>
      __$$UserPetImplCopyWithImpl<_$UserPetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPetImplToJson(
      this,
    );
  }
}

abstract class _UserPet extends UserPet {
  const factory _UserPet(
      {required final int id,
      required final int userID,
      required final int petID,
      required final int accessoryID,
      required final int health,
      required final int hunger,
      required final int exp,
      required final String name}) = _$UserPetImpl;
  const _UserPet._() : super._();

  factory _UserPet.fromJson(Map<String, dynamic> json) = _$UserPetImpl.fromJson;

  @override
  int get id;
  @override
  int get userID;
  @override
  int get petID;
  @override
  int get accessoryID;
  @override
  int get health;
  @override
  int get hunger;
  @override
  int get exp;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UserPetImplCopyWith<_$UserPetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
