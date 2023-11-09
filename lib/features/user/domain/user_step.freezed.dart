// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserStep _$UserStepFromJson(Map<String, dynamic> json) {
  return _UserStep.fromJson(json);
}

/// @nodoc
mixin _$UserStep {
  int get id => throw _privateConstructorUsedError;
  int get userID => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStepCopyWith<UserStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStepCopyWith<$Res> {
  factory $UserStepCopyWith(UserStep value, $Res Function(UserStep) then) =
      _$UserStepCopyWithImpl<$Res, UserStep>;
  @useResult
  $Res call({int id, int userID, String date, int steps});
}

/// @nodoc
class _$UserStepCopyWithImpl<$Res, $Val extends UserStep>
    implements $UserStepCopyWith<$Res> {
  _$UserStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userID = null,
    Object? date = null,
    Object? steps = null,
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStepImplCopyWith<$Res>
    implements $UserStepCopyWith<$Res> {
  factory _$$UserStepImplCopyWith(
          _$UserStepImpl value, $Res Function(_$UserStepImpl) then) =
      __$$UserStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int userID, String date, int steps});
}

/// @nodoc
class __$$UserStepImplCopyWithImpl<$Res>
    extends _$UserStepCopyWithImpl<$Res, _$UserStepImpl>
    implements _$$UserStepImplCopyWith<$Res> {
  __$$UserStepImplCopyWithImpl(
      _$UserStepImpl _value, $Res Function(_$UserStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userID = null,
    Object? date = null,
    Object? steps = null,
  }) {
    return _then(_$UserStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStepImpl extends _UserStep {
  const _$UserStepImpl(
      {required this.id,
      required this.userID,
      required this.date,
      required this.steps})
      : super._();

  factory _$UserStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStepImplFromJson(json);

  @override
  final int id;
  @override
  final int userID;
  @override
  final String date;
  @override
  final int steps;

  @override
  String toString() {
    return 'UserStep(id: $id, userID: $userID, date: $date, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.steps, steps) || other.steps == steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userID, date, steps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStepImplCopyWith<_$UserStepImpl> get copyWith =>
      __$$UserStepImplCopyWithImpl<_$UserStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStepImplToJson(
      this,
    );
  }
}

abstract class _UserStep extends UserStep {
  const factory _UserStep(
      {required final int id,
      required final int userID,
      required final String date,
      required final int steps}) = _$UserStepImpl;
  const _UserStep._() : super._();

  factory _UserStep.fromJson(Map<String, dynamic> json) =
      _$UserStepImpl.fromJson;

  @override
  int get id;
  @override
  int get userID;
  @override
  String get date;
  @override
  int get steps;
  @override
  @JsonKey(ignore: true)
  _$$UserStepImplCopyWith<_$UserStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
