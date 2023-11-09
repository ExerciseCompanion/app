// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserTask _$UserTaskFromJson(Map<String, dynamic> json) {
  return _UserTask.fromJson(json);
}

/// @nodoc
mixin _$UserTask {
  int get id => throw _privateConstructorUsedError;
  int get UserTaskID => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get reward => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTaskCopyWith<UserTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTaskCopyWith<$Res> {
  factory $UserTaskCopyWith(UserTask value, $Res Function(UserTask) then) =
      _$UserTaskCopyWithImpl<$Res, UserTask>;
  @useResult
  $Res call(
      {int id,
      int UserTaskID,
      String title,
      String description,
      int reward,
      int status});
}

/// @nodoc
class _$UserTaskCopyWithImpl<$Res, $Val extends UserTask>
    implements $UserTaskCopyWith<$Res> {
  _$UserTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? UserTaskID = null,
    Object? title = null,
    Object? description = null,
    Object? reward = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      UserTaskID: null == UserTaskID
          ? _value.UserTaskID
          : UserTaskID // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTaskImplCopyWith<$Res>
    implements $UserTaskCopyWith<$Res> {
  factory _$$UserTaskImplCopyWith(
          _$UserTaskImpl value, $Res Function(_$UserTaskImpl) then) =
      __$$UserTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int UserTaskID,
      String title,
      String description,
      int reward,
      int status});
}

/// @nodoc
class __$$UserTaskImplCopyWithImpl<$Res>
    extends _$UserTaskCopyWithImpl<$Res, _$UserTaskImpl>
    implements _$$UserTaskImplCopyWith<$Res> {
  __$$UserTaskImplCopyWithImpl(
      _$UserTaskImpl _value, $Res Function(_$UserTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? UserTaskID = null,
    Object? title = null,
    Object? description = null,
    Object? reward = null,
    Object? status = null,
  }) {
    return _then(_$UserTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      UserTaskID: null == UserTaskID
          ? _value.UserTaskID
          : UserTaskID // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTaskImpl extends _UserTask {
  const _$UserTaskImpl(
      {required this.id,
      required this.UserTaskID,
      required this.title,
      required this.description,
      required this.reward,
      required this.status})
      : super._();

  factory _$UserTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTaskImplFromJson(json);

  @override
  final int id;
  @override
  final int UserTaskID;
  @override
  final String title;
  @override
  final String description;
  @override
  final int reward;
  @override
  final int status;

  @override
  String toString() {
    return 'UserTask(id: $id, UserTaskID: $UserTaskID, title: $title, description: $description, reward: $reward, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.UserTaskID, UserTaskID) ||
                other.UserTaskID == UserTaskID) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, UserTaskID, title, description, reward, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTaskImplCopyWith<_$UserTaskImpl> get copyWith =>
      __$$UserTaskImplCopyWithImpl<_$UserTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTaskImplToJson(
      this,
    );
  }
}

abstract class _UserTask extends UserTask {
  const factory _UserTask(
      {required final int id,
      required final int UserTaskID,
      required final String title,
      required final String description,
      required final int reward,
      required final int status}) = _$UserTaskImpl;
  const _UserTask._() : super._();

  factory _UserTask.fromJson(Map<String, dynamic> json) =
      _$UserTaskImpl.fromJson;

  @override
  int get id;
  @override
  int get UserTaskID;
  @override
  String get title;
  @override
  String get description;
  @override
  int get reward;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$UserTaskImplCopyWith<_$UserTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
