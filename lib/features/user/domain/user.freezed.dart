// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get currency => throw _privateConstructorUsedError;
  int get mainPetID => throw _privateConstructorUsedError;
  String get backdropAsset => throw _privateConstructorUsedError;
  List<int> get purchasedItemsIDs => throw _privateConstructorUsedError;
  List<int> get petInventoryIDs => throw _privateConstructorUsedError;
  List<int> get accessoryInventoryIDs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String username,
      String email,
      int currency,
      int mainPetID,
      String backdropAsset,
      List<int> purchasedItemsIDs,
      List<int> petInventoryIDs,
      List<int> accessoryInventoryIDs});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? currency = null,
    Object? mainPetID = null,
    Object? backdropAsset = null,
    Object? purchasedItemsIDs = null,
    Object? petInventoryIDs = null,
    Object? accessoryInventoryIDs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as int,
      mainPetID: null == mainPetID
          ? _value.mainPetID
          : mainPetID // ignore: cast_nullable_to_non_nullable
              as int,
      backdropAsset: null == backdropAsset
          ? _value.backdropAsset
          : backdropAsset // ignore: cast_nullable_to_non_nullable
              as String,
      purchasedItemsIDs: null == purchasedItemsIDs
          ? _value.purchasedItemsIDs
          : purchasedItemsIDs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      petInventoryIDs: null == petInventoryIDs
          ? _value.petInventoryIDs
          : petInventoryIDs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      accessoryInventoryIDs: null == accessoryInventoryIDs
          ? _value.accessoryInventoryIDs
          : accessoryInventoryIDs // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String email,
      int currency,
      int mainPetID,
      String backdropAsset,
      List<int> purchasedItemsIDs,
      List<int> petInventoryIDs,
      List<int> accessoryInventoryIDs});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? currency = null,
    Object? mainPetID = null,
    Object? backdropAsset = null,
    Object? purchasedItemsIDs = null,
    Object? petInventoryIDs = null,
    Object? accessoryInventoryIDs = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as int,
      mainPetID: null == mainPetID
          ? _value.mainPetID
          : mainPetID // ignore: cast_nullable_to_non_nullable
              as int,
      backdropAsset: null == backdropAsset
          ? _value.backdropAsset
          : backdropAsset // ignore: cast_nullable_to_non_nullable
              as String,
      purchasedItemsIDs: null == purchasedItemsIDs
          ? _value._purchasedItemsIDs
          : purchasedItemsIDs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      petInventoryIDs: null == petInventoryIDs
          ? _value._petInventoryIDs
          : petInventoryIDs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      accessoryInventoryIDs: null == accessoryInventoryIDs
          ? _value._accessoryInventoryIDs
          : accessoryInventoryIDs // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.username,
      required this.email,
      required this.currency,
      required this.mainPetID,
      required this.backdropAsset,
      required final List<int> purchasedItemsIDs,
      required final List<int> petInventoryIDs,
      required final List<int> accessoryInventoryIDs})
      : _purchasedItemsIDs = purchasedItemsIDs,
        _petInventoryIDs = petInventoryIDs,
        _accessoryInventoryIDs = accessoryInventoryIDs,
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String email;
  @override
  final int currency;
  @override
  final int mainPetID;
  @override
  final String backdropAsset;
  final List<int> _purchasedItemsIDs;
  @override
  List<int> get purchasedItemsIDs {
    if (_purchasedItemsIDs is EqualUnmodifiableListView)
      return _purchasedItemsIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchasedItemsIDs);
  }

  final List<int> _petInventoryIDs;
  @override
  List<int> get petInventoryIDs {
    if (_petInventoryIDs is EqualUnmodifiableListView) return _petInventoryIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_petInventoryIDs);
  }

  final List<int> _accessoryInventoryIDs;
  @override
  List<int> get accessoryInventoryIDs {
    if (_accessoryInventoryIDs is EqualUnmodifiableListView)
      return _accessoryInventoryIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessoryInventoryIDs);
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, currency: $currency, mainPetID: $mainPetID, backdropAsset: $backdropAsset, purchasedItemsIDs: $purchasedItemsIDs, petInventoryIDs: $petInventoryIDs, accessoryInventoryIDs: $accessoryInventoryIDs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.mainPetID, mainPetID) ||
                other.mainPetID == mainPetID) &&
            (identical(other.backdropAsset, backdropAsset) ||
                other.backdropAsset == backdropAsset) &&
            const DeepCollectionEquality()
                .equals(other._purchasedItemsIDs, _purchasedItemsIDs) &&
            const DeepCollectionEquality()
                .equals(other._petInventoryIDs, _petInventoryIDs) &&
            const DeepCollectionEquality()
                .equals(other._accessoryInventoryIDs, _accessoryInventoryIDs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      email,
      currency,
      mainPetID,
      backdropAsset,
      const DeepCollectionEquality().hash(_purchasedItemsIDs),
      const DeepCollectionEquality().hash(_petInventoryIDs),
      const DeepCollectionEquality().hash(_accessoryInventoryIDs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final int id,
      required final String username,
      required final String email,
      required final int currency,
      required final int mainPetID,
      required final String backdropAsset,
      required final List<int> purchasedItemsIDs,
      required final List<int> petInventoryIDs,
      required final List<int> accessoryInventoryIDs}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get email;
  @override
  int get currency;
  @override
  int get mainPetID;
  @override
  String get backdropAsset;
  @override
  List<int> get purchasedItemsIDs;
  @override
  List<int> get petInventoryIDs;
  @override
  List<int> get accessoryInventoryIDs;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
