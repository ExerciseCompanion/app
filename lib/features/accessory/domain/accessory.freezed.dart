// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accessory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Accessory _$AccessoryFromJson(Map<String, dynamic> json) {
  return _Accessory.fromJson(json);
}

/// @nodoc
mixin _$Accessory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get asset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessoryCopyWith<Accessory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessoryCopyWith<$Res> {
  factory $AccessoryCopyWith(Accessory value, $Res Function(Accessory) then) =
      _$AccessoryCopyWithImpl<$Res, Accessory>;
  @useResult
  $Res call({int id, String name, String description, String asset});
}

/// @nodoc
class _$AccessoryCopyWithImpl<$Res, $Val extends Accessory>
    implements $AccessoryCopyWith<$Res> {
  _$AccessoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? asset = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessoryImplCopyWith<$Res>
    implements $AccessoryCopyWith<$Res> {
  factory _$$AccessoryImplCopyWith(
          _$AccessoryImpl value, $Res Function(_$AccessoryImpl) then) =
      __$$AccessoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String description, String asset});
}

/// @nodoc
class __$$AccessoryImplCopyWithImpl<$Res>
    extends _$AccessoryCopyWithImpl<$Res, _$AccessoryImpl>
    implements _$$AccessoryImplCopyWith<$Res> {
  __$$AccessoryImplCopyWithImpl(
      _$AccessoryImpl _value, $Res Function(_$AccessoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? asset = null,
  }) {
    return _then(_$AccessoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessoryImpl extends _Accessory {
  const _$AccessoryImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.asset})
      : super._();

  factory _$AccessoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String asset;

  @override
  String toString() {
    return 'Accessory(id: $id, name: $name, description: $description, asset: $asset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.asset, asset) || other.asset == asset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, asset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessoryImplCopyWith<_$AccessoryImpl> get copyWith =>
      __$$AccessoryImplCopyWithImpl<_$AccessoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessoryImplToJson(
      this,
    );
  }
}

abstract class _Accessory extends Accessory {
  const factory _Accessory(
      {required final int id,
      required final String name,
      required final String description,
      required final String asset}) = _$AccessoryImpl;
  const _Accessory._() : super._();

  factory _Accessory.fromJson(Map<String, dynamic> json) =
      _$AccessoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get asset;
  @override
  @JsonKey(ignore: true)
  _$$AccessoryImplCopyWith<_$AccessoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
