// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUserData,
    required TResult Function(String userId) getUserInfo,
    required TResult Function(String name, String phoneNumber, String email)
        updateUserData,
    required TResult Function(
            String oldPassword, String password, String passwordConfirmation)
        updateUserPassword,
    required TResult Function(Uint8List bytes) updateUserProfilePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserData,
    TResult? Function(String userId)? getUserInfo,
    TResult? Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult? Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult? Function(Uint8List bytes)? updateUserProfilePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserData,
    TResult Function(String userId)? getUserInfo,
    TResult Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult Function(Uint8List bytes)? updateUserProfilePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_GetUserInfo value) getUserInfo,
    required TResult Function(_UpdateUserData value) updateUserData,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_UpdateUserProfilePhoto value)
        updateUserProfilePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_GetUserInfo value)? getUserInfo,
    TResult? Function(_UpdateUserData value)? updateUserData,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_GetUserInfo value)? getUserInfo,
    TResult Function(_UpdateUserData value)? updateUserData,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataEventCopyWith<$Res> {
  factory $UserDataEventCopyWith(
          UserDataEvent value, $Res Function(UserDataEvent) then) =
      _$UserDataEventCopyWithImpl<$Res, UserDataEvent>;
}

/// @nodoc
class _$UserDataEventCopyWithImpl<$Res, $Val extends UserDataEvent>
    implements $UserDataEventCopyWith<$Res> {
  _$UserDataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$UserDataEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UserDataEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUserData,
    required TResult Function(String userId) getUserInfo,
    required TResult Function(String name, String phoneNumber, String email)
        updateUserData,
    required TResult Function(
            String oldPassword, String password, String passwordConfirmation)
        updateUserPassword,
    required TResult Function(Uint8List bytes) updateUserProfilePhoto,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserData,
    TResult? Function(String userId)? getUserInfo,
    TResult? Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult? Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult? Function(Uint8List bytes)? updateUserProfilePhoto,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserData,
    TResult Function(String userId)? getUserInfo,
    TResult Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult Function(Uint8List bytes)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_GetUserInfo value) getUserInfo,
    required TResult Function(_UpdateUserData value) updateUserData,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_UpdateUserProfilePhoto value)
        updateUserProfilePhoto,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_GetUserInfo value)? getUserInfo,
    TResult? Function(_UpdateUserData value)? updateUserData,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_GetUserInfo value)? getUserInfo,
    TResult Function(_UpdateUserData value)? updateUserData,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UserDataEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetUserDataImplCopyWith<$Res> {
  factory _$$GetUserDataImplCopyWith(
          _$GetUserDataImpl value, $Res Function(_$GetUserDataImpl) then) =
      __$$GetUserDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserDataImplCopyWithImpl<$Res>
    extends _$UserDataEventCopyWithImpl<$Res, _$GetUserDataImpl>
    implements _$$GetUserDataImplCopyWith<$Res> {
  __$$GetUserDataImplCopyWithImpl(
      _$GetUserDataImpl _value, $Res Function(_$GetUserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserDataImpl implements _GetUserData {
  const _$GetUserDataImpl();

  @override
  String toString() {
    return 'UserDataEvent.getUserData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUserData,
    required TResult Function(String userId) getUserInfo,
    required TResult Function(String name, String phoneNumber, String email)
        updateUserData,
    required TResult Function(
            String oldPassword, String password, String passwordConfirmation)
        updateUserPassword,
    required TResult Function(Uint8List bytes) updateUserProfilePhoto,
  }) {
    return getUserData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserData,
    TResult? Function(String userId)? getUserInfo,
    TResult? Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult? Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult? Function(Uint8List bytes)? updateUserProfilePhoto,
  }) {
    return getUserData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserData,
    TResult Function(String userId)? getUserInfo,
    TResult Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult Function(Uint8List bytes)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_GetUserInfo value) getUserInfo,
    required TResult Function(_UpdateUserData value) updateUserData,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_UpdateUserProfilePhoto value)
        updateUserProfilePhoto,
  }) {
    return getUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_GetUserInfo value)? getUserInfo,
    TResult? Function(_UpdateUserData value)? updateUserData,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
  }) {
    return getUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_GetUserInfo value)? getUserInfo,
    TResult Function(_UpdateUserData value)? updateUserData,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData(this);
    }
    return orElse();
  }
}

abstract class _GetUserData implements UserDataEvent {
  const factory _GetUserData() = _$GetUserDataImpl;
}

/// @nodoc
abstract class _$$GetUserInfoImplCopyWith<$Res> {
  factory _$$GetUserInfoImplCopyWith(
          _$GetUserInfoImpl value, $Res Function(_$GetUserInfoImpl) then) =
      __$$GetUserInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetUserInfoImplCopyWithImpl<$Res>
    extends _$UserDataEventCopyWithImpl<$Res, _$GetUserInfoImpl>
    implements _$$GetUserInfoImplCopyWith<$Res> {
  __$$GetUserInfoImplCopyWithImpl(
      _$GetUserInfoImpl _value, $Res Function(_$GetUserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetUserInfoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserInfoImpl implements _GetUserInfo {
  const _$GetUserInfoImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'UserDataEvent.getUserInfo(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserInfoImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserInfoImplCopyWith<_$GetUserInfoImpl> get copyWith =>
      __$$GetUserInfoImplCopyWithImpl<_$GetUserInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUserData,
    required TResult Function(String userId) getUserInfo,
    required TResult Function(String name, String phoneNumber, String email)
        updateUserData,
    required TResult Function(
            String oldPassword, String password, String passwordConfirmation)
        updateUserPassword,
    required TResult Function(Uint8List bytes) updateUserProfilePhoto,
  }) {
    return getUserInfo(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserData,
    TResult? Function(String userId)? getUserInfo,
    TResult? Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult? Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult? Function(Uint8List bytes)? updateUserProfilePhoto,
  }) {
    return getUserInfo?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserData,
    TResult Function(String userId)? getUserInfo,
    TResult Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult Function(Uint8List bytes)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_GetUserInfo value) getUserInfo,
    required TResult Function(_UpdateUserData value) updateUserData,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_UpdateUserProfilePhoto value)
        updateUserProfilePhoto,
  }) {
    return getUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_GetUserInfo value)? getUserInfo,
    TResult? Function(_UpdateUserData value)? updateUserData,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
  }) {
    return getUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_GetUserInfo value)? getUserInfo,
    TResult Function(_UpdateUserData value)? updateUserData,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo(this);
    }
    return orElse();
  }
}

abstract class _GetUserInfo implements UserDataEvent {
  const factory _GetUserInfo({required final String userId}) =
      _$GetUserInfoImpl;

  String get userId;

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserInfoImplCopyWith<_$GetUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserDataImplCopyWith<$Res> {
  factory _$$UpdateUserDataImplCopyWith(_$UpdateUserDataImpl value,
          $Res Function(_$UpdateUserDataImpl) then) =
      __$$UpdateUserDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String phoneNumber, String email});
}

/// @nodoc
class __$$UpdateUserDataImplCopyWithImpl<$Res>
    extends _$UserDataEventCopyWithImpl<$Res, _$UpdateUserDataImpl>
    implements _$$UpdateUserDataImplCopyWith<$Res> {
  __$$UpdateUserDataImplCopyWithImpl(
      _$UpdateUserDataImpl _value, $Res Function(_$UpdateUserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = null,
  }) {
    return _then(_$UpdateUserDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateUserDataImpl implements _UpdateUserData {
  const _$UpdateUserDataImpl(
      {required this.name, required this.phoneNumber, required this.email});

  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String email;

  @override
  String toString() {
    return 'UserDataEvent.updateUserData(name: $name, phoneNumber: $phoneNumber, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber, email);

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserDataImplCopyWith<_$UpdateUserDataImpl> get copyWith =>
      __$$UpdateUserDataImplCopyWithImpl<_$UpdateUserDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUserData,
    required TResult Function(String userId) getUserInfo,
    required TResult Function(String name, String phoneNumber, String email)
        updateUserData,
    required TResult Function(
            String oldPassword, String password, String passwordConfirmation)
        updateUserPassword,
    required TResult Function(Uint8List bytes) updateUserProfilePhoto,
  }) {
    return updateUserData(name, phoneNumber, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserData,
    TResult? Function(String userId)? getUserInfo,
    TResult? Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult? Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult? Function(Uint8List bytes)? updateUserProfilePhoto,
  }) {
    return updateUserData?.call(name, phoneNumber, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserData,
    TResult Function(String userId)? getUserInfo,
    TResult Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult Function(Uint8List bytes)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (updateUserData != null) {
      return updateUserData(name, phoneNumber, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_GetUserInfo value) getUserInfo,
    required TResult Function(_UpdateUserData value) updateUserData,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_UpdateUserProfilePhoto value)
        updateUserProfilePhoto,
  }) {
    return updateUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_GetUserInfo value)? getUserInfo,
    TResult? Function(_UpdateUserData value)? updateUserData,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
  }) {
    return updateUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_GetUserInfo value)? getUserInfo,
    TResult Function(_UpdateUserData value)? updateUserData,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (updateUserData != null) {
      return updateUserData(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserData implements UserDataEvent {
  const factory _UpdateUserData(
      {required final String name,
      required final String phoneNumber,
      required final String email}) = _$UpdateUserDataImpl;

  String get name;
  String get phoneNumber;
  String get email;

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserDataImplCopyWith<_$UpdateUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserPasswordImplCopyWith<$Res> {
  factory _$$UpdateUserPasswordImplCopyWith(_$UpdateUserPasswordImpl value,
          $Res Function(_$UpdateUserPasswordImpl) then) =
      __$$UpdateUserPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String oldPassword, String password, String passwordConfirmation});
}

/// @nodoc
class __$$UpdateUserPasswordImplCopyWithImpl<$Res>
    extends _$UserDataEventCopyWithImpl<$Res, _$UpdateUserPasswordImpl>
    implements _$$UpdateUserPasswordImplCopyWith<$Res> {
  __$$UpdateUserPasswordImplCopyWithImpl(_$UpdateUserPasswordImpl _value,
      $Res Function(_$UpdateUserPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldPassword = null,
    Object? password = null,
    Object? passwordConfirmation = null,
  }) {
    return _then(_$UpdateUserPasswordImpl(
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateUserPasswordImpl implements _UpdateUserPassword {
  const _$UpdateUserPasswordImpl(
      {required this.oldPassword,
      required this.password,
      required this.passwordConfirmation});

  @override
  final String oldPassword;
  @override
  final String password;
  @override
  final String passwordConfirmation;

  @override
  String toString() {
    return 'UserDataEvent.updateUserPassword(oldPassword: $oldPassword, password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserPasswordImpl &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, oldPassword, password, passwordConfirmation);

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserPasswordImplCopyWith<_$UpdateUserPasswordImpl> get copyWith =>
      __$$UpdateUserPasswordImplCopyWithImpl<_$UpdateUserPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUserData,
    required TResult Function(String userId) getUserInfo,
    required TResult Function(String name, String phoneNumber, String email)
        updateUserData,
    required TResult Function(
            String oldPassword, String password, String passwordConfirmation)
        updateUserPassword,
    required TResult Function(Uint8List bytes) updateUserProfilePhoto,
  }) {
    return updateUserPassword(oldPassword, password, passwordConfirmation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserData,
    TResult? Function(String userId)? getUserInfo,
    TResult? Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult? Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult? Function(Uint8List bytes)? updateUserProfilePhoto,
  }) {
    return updateUserPassword?.call(
        oldPassword, password, passwordConfirmation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserData,
    TResult Function(String userId)? getUserInfo,
    TResult Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult Function(Uint8List bytes)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (updateUserPassword != null) {
      return updateUserPassword(oldPassword, password, passwordConfirmation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_GetUserInfo value) getUserInfo,
    required TResult Function(_UpdateUserData value) updateUserData,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_UpdateUserProfilePhoto value)
        updateUserProfilePhoto,
  }) {
    return updateUserPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_GetUserInfo value)? getUserInfo,
    TResult? Function(_UpdateUserData value)? updateUserData,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
  }) {
    return updateUserPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_GetUserInfo value)? getUserInfo,
    TResult Function(_UpdateUserData value)? updateUserData,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (updateUserPassword != null) {
      return updateUserPassword(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserPassword implements UserDataEvent {
  const factory _UpdateUserPassword(
      {required final String oldPassword,
      required final String password,
      required final String passwordConfirmation}) = _$UpdateUserPasswordImpl;

  String get oldPassword;
  String get password;
  String get passwordConfirmation;

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserPasswordImplCopyWith<_$UpdateUserPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserProfilePhotoImplCopyWith<$Res> {
  factory _$$UpdateUserProfilePhotoImplCopyWith(
          _$UpdateUserProfilePhotoImpl value,
          $Res Function(_$UpdateUserProfilePhotoImpl) then) =
      __$$UpdateUserProfilePhotoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List bytes});
}

/// @nodoc
class __$$UpdateUserProfilePhotoImplCopyWithImpl<$Res>
    extends _$UserDataEventCopyWithImpl<$Res, _$UpdateUserProfilePhotoImpl>
    implements _$$UpdateUserProfilePhotoImplCopyWith<$Res> {
  __$$UpdateUserProfilePhotoImplCopyWithImpl(
      _$UpdateUserProfilePhotoImpl _value,
      $Res Function(_$UpdateUserProfilePhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytes = null,
  }) {
    return _then(_$UpdateUserProfilePhotoImpl(
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$UpdateUserProfilePhotoImpl implements _UpdateUserProfilePhoto {
  const _$UpdateUserProfilePhotoImpl({required this.bytes});

  @override
  final Uint8List bytes;

  @override
  String toString() {
    return 'UserDataEvent.updateUserProfilePhoto(bytes: $bytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserProfilePhotoImpl &&
            const DeepCollectionEquality().equals(other.bytes, bytes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(bytes));

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserProfilePhotoImplCopyWith<_$UpdateUserProfilePhotoImpl>
      get copyWith => __$$UpdateUserProfilePhotoImplCopyWithImpl<
          _$UpdateUserProfilePhotoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUserData,
    required TResult Function(String userId) getUserInfo,
    required TResult Function(String name, String phoneNumber, String email)
        updateUserData,
    required TResult Function(
            String oldPassword, String password, String passwordConfirmation)
        updateUserPassword,
    required TResult Function(Uint8List bytes) updateUserProfilePhoto,
  }) {
    return updateUserProfilePhoto(bytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserData,
    TResult? Function(String userId)? getUserInfo,
    TResult? Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult? Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult? Function(Uint8List bytes)? updateUserProfilePhoto,
  }) {
    return updateUserProfilePhoto?.call(bytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserData,
    TResult Function(String userId)? getUserInfo,
    TResult Function(String name, String phoneNumber, String email)?
        updateUserData,
    TResult Function(
            String oldPassword, String password, String passwordConfirmation)?
        updateUserPassword,
    TResult Function(Uint8List bytes)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (updateUserProfilePhoto != null) {
      return updateUserProfilePhoto(bytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_GetUserInfo value) getUserInfo,
    required TResult Function(_UpdateUserData value) updateUserData,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_UpdateUserProfilePhoto value)
        updateUserProfilePhoto,
  }) {
    return updateUserProfilePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_GetUserInfo value)? getUserInfo,
    TResult? Function(_UpdateUserData value)? updateUserData,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
  }) {
    return updateUserProfilePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_GetUserInfo value)? getUserInfo,
    TResult Function(_UpdateUserData value)? updateUserData,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_UpdateUserProfilePhoto value)? updateUserProfilePhoto,
    required TResult orElse(),
  }) {
    if (updateUserProfilePhoto != null) {
      return updateUserProfilePhoto(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserProfilePhoto implements UserDataEvent {
  const factory _UpdateUserProfilePhoto({required final Uint8List bytes}) =
      _$UpdateUserProfilePhotoImpl;

  Uint8List get bytes;

  /// Create a copy of UserDataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserProfilePhotoImplCopyWith<_$UpdateUserProfilePhotoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) successGetUserData,
    required TResult Function(User user) successGetUserInfo,
    required TResult Function(User user) successUpdateUserData,
    required TResult Function() successUpdateUserPassword,
    required TResult Function(User user) successUpdateUserProfilePhoto,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? successGetUserData,
    TResult? Function(User user)? successGetUserInfo,
    TResult? Function(User user)? successUpdateUserData,
    TResult? Function()? successUpdateUserPassword,
    TResult? Function(User user)? successUpdateUserProfilePhoto,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? successGetUserData,
    TResult Function(User user)? successGetUserInfo,
    TResult Function(User user)? successUpdateUserData,
    TResult Function()? successUpdateUserPassword,
    TResult Function(User user)? successUpdateUserProfilePhoto,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessGetUserData value) successGetUserData,
    required TResult Function(_SuccessGetUserInfo value) successGetUserInfo,
    required TResult Function(_SuccessUpdateUserData value)
        successUpdateUserData,
    required TResult Function(_SuccessUpdateUserPassword value)
        successUpdateUserPassword,
    required TResult Function(_SuccessUpdateUserProfilePhoto value)
        successUpdateUserProfilePhoto,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessGetUserData value)? successGetUserData,
    TResult? Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult? Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult? Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult? Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessGetUserData value)? successGetUserData,
    TResult Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataStateCopyWith<$Res> {
  factory $UserDataStateCopyWith(
          UserDataState value, $Res Function(UserDataState) then) =
      _$UserDataStateCopyWithImpl<$Res, UserDataState>;
}

/// @nodoc
class _$UserDataStateCopyWithImpl<$Res, $Val extends UserDataState>
    implements $UserDataStateCopyWith<$Res> {
  _$UserDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserDataState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) successGetUserData,
    required TResult Function(User user) successGetUserInfo,
    required TResult Function(User user) successUpdateUserData,
    required TResult Function() successUpdateUserPassword,
    required TResult Function(User user) successUpdateUserProfilePhoto,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? successGetUserData,
    TResult? Function(User user)? successGetUserInfo,
    TResult? Function(User user)? successUpdateUserData,
    TResult? Function()? successUpdateUserPassword,
    TResult? Function(User user)? successUpdateUserProfilePhoto,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? successGetUserData,
    TResult Function(User user)? successGetUserInfo,
    TResult Function(User user)? successUpdateUserData,
    TResult Function()? successUpdateUserPassword,
    TResult Function(User user)? successUpdateUserProfilePhoto,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessGetUserData value) successGetUserData,
    required TResult Function(_SuccessGetUserInfo value) successGetUserInfo,
    required TResult Function(_SuccessUpdateUserData value)
        successUpdateUserData,
    required TResult Function(_SuccessUpdateUserPassword value)
        successUpdateUserPassword,
    required TResult Function(_SuccessUpdateUserProfilePhoto value)
        successUpdateUserProfilePhoto,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessGetUserData value)? successGetUserData,
    TResult? Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult? Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult? Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult? Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessGetUserData value)? successGetUserData,
    TResult Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserDataState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserDataState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) successGetUserData,
    required TResult Function(User user) successGetUserInfo,
    required TResult Function(User user) successUpdateUserData,
    required TResult Function() successUpdateUserPassword,
    required TResult Function(User user) successUpdateUserProfilePhoto,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? successGetUserData,
    TResult? Function(User user)? successGetUserInfo,
    TResult? Function(User user)? successUpdateUserData,
    TResult? Function()? successUpdateUserPassword,
    TResult? Function(User user)? successUpdateUserProfilePhoto,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? successGetUserData,
    TResult Function(User user)? successGetUserInfo,
    TResult Function(User user)? successUpdateUserData,
    TResult Function()? successUpdateUserPassword,
    TResult Function(User user)? successUpdateUserProfilePhoto,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessGetUserData value) successGetUserData,
    required TResult Function(_SuccessGetUserInfo value) successGetUserInfo,
    required TResult Function(_SuccessUpdateUserData value)
        successUpdateUserData,
    required TResult Function(_SuccessUpdateUserPassword value)
        successUpdateUserPassword,
    required TResult Function(_SuccessUpdateUserProfilePhoto value)
        successUpdateUserProfilePhoto,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessGetUserData value)? successGetUserData,
    TResult? Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult? Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult? Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult? Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessGetUserData value)? successGetUserData,
    TResult Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserDataState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessGetUserDataImplCopyWith<$Res> {
  factory _$$SuccessGetUserDataImplCopyWith(_$SuccessGetUserDataImpl value,
          $Res Function(_$SuccessGetUserDataImpl) then) =
      __$$SuccessGetUserDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$SuccessGetUserDataImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res, _$SuccessGetUserDataImpl>
    implements _$$SuccessGetUserDataImplCopyWith<$Res> {
  __$$SuccessGetUserDataImplCopyWithImpl(_$SuccessGetUserDataImpl _value,
      $Res Function(_$SuccessGetUserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SuccessGetUserDataImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$SuccessGetUserDataImpl implements _SuccessGetUserData {
  const _$SuccessGetUserDataImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserDataState.successGetUserData(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetUserDataImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetUserDataImplCopyWith<_$SuccessGetUserDataImpl> get copyWith =>
      __$$SuccessGetUserDataImplCopyWithImpl<_$SuccessGetUserDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) successGetUserData,
    required TResult Function(User user) successGetUserInfo,
    required TResult Function(User user) successUpdateUserData,
    required TResult Function() successUpdateUserPassword,
    required TResult Function(User user) successUpdateUserProfilePhoto,
    required TResult Function(String message) error,
  }) {
    return successGetUserData(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? successGetUserData,
    TResult? Function(User user)? successGetUserInfo,
    TResult? Function(User user)? successUpdateUserData,
    TResult? Function()? successUpdateUserPassword,
    TResult? Function(User user)? successUpdateUserProfilePhoto,
    TResult? Function(String message)? error,
  }) {
    return successGetUserData?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? successGetUserData,
    TResult Function(User user)? successGetUserInfo,
    TResult Function(User user)? successUpdateUserData,
    TResult Function()? successUpdateUserPassword,
    TResult Function(User user)? successUpdateUserProfilePhoto,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (successGetUserData != null) {
      return successGetUserData(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessGetUserData value) successGetUserData,
    required TResult Function(_SuccessGetUserInfo value) successGetUserInfo,
    required TResult Function(_SuccessUpdateUserData value)
        successUpdateUserData,
    required TResult Function(_SuccessUpdateUserPassword value)
        successUpdateUserPassword,
    required TResult Function(_SuccessUpdateUserProfilePhoto value)
        successUpdateUserProfilePhoto,
    required TResult Function(_Error value) error,
  }) {
    return successGetUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessGetUserData value)? successGetUserData,
    TResult? Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult? Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult? Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult? Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult? Function(_Error value)? error,
  }) {
    return successGetUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessGetUserData value)? successGetUserData,
    TResult Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (successGetUserData != null) {
      return successGetUserData(this);
    }
    return orElse();
  }
}

abstract class _SuccessGetUserData implements UserDataState {
  const factory _SuccessGetUserData(final User user) = _$SuccessGetUserDataImpl;

  User get user;

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessGetUserDataImplCopyWith<_$SuccessGetUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessGetUserInfoImplCopyWith<$Res> {
  factory _$$SuccessGetUserInfoImplCopyWith(_$SuccessGetUserInfoImpl value,
          $Res Function(_$SuccessGetUserInfoImpl) then) =
      __$$SuccessGetUserInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$SuccessGetUserInfoImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res, _$SuccessGetUserInfoImpl>
    implements _$$SuccessGetUserInfoImplCopyWith<$Res> {
  __$$SuccessGetUserInfoImplCopyWithImpl(_$SuccessGetUserInfoImpl _value,
      $Res Function(_$SuccessGetUserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SuccessGetUserInfoImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$SuccessGetUserInfoImpl implements _SuccessGetUserInfo {
  const _$SuccessGetUserInfoImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserDataState.successGetUserInfo(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetUserInfoImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetUserInfoImplCopyWith<_$SuccessGetUserInfoImpl> get copyWith =>
      __$$SuccessGetUserInfoImplCopyWithImpl<_$SuccessGetUserInfoImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) successGetUserData,
    required TResult Function(User user) successGetUserInfo,
    required TResult Function(User user) successUpdateUserData,
    required TResult Function() successUpdateUserPassword,
    required TResult Function(User user) successUpdateUserProfilePhoto,
    required TResult Function(String message) error,
  }) {
    return successGetUserInfo(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? successGetUserData,
    TResult? Function(User user)? successGetUserInfo,
    TResult? Function(User user)? successUpdateUserData,
    TResult? Function()? successUpdateUserPassword,
    TResult? Function(User user)? successUpdateUserProfilePhoto,
    TResult? Function(String message)? error,
  }) {
    return successGetUserInfo?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? successGetUserData,
    TResult Function(User user)? successGetUserInfo,
    TResult Function(User user)? successUpdateUserData,
    TResult Function()? successUpdateUserPassword,
    TResult Function(User user)? successUpdateUserProfilePhoto,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (successGetUserInfo != null) {
      return successGetUserInfo(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessGetUserData value) successGetUserData,
    required TResult Function(_SuccessGetUserInfo value) successGetUserInfo,
    required TResult Function(_SuccessUpdateUserData value)
        successUpdateUserData,
    required TResult Function(_SuccessUpdateUserPassword value)
        successUpdateUserPassword,
    required TResult Function(_SuccessUpdateUserProfilePhoto value)
        successUpdateUserProfilePhoto,
    required TResult Function(_Error value) error,
  }) {
    return successGetUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessGetUserData value)? successGetUserData,
    TResult? Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult? Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult? Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult? Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult? Function(_Error value)? error,
  }) {
    return successGetUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessGetUserData value)? successGetUserData,
    TResult Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (successGetUserInfo != null) {
      return successGetUserInfo(this);
    }
    return orElse();
  }
}

abstract class _SuccessGetUserInfo implements UserDataState {
  const factory _SuccessGetUserInfo(final User user) = _$SuccessGetUserInfoImpl;

  User get user;

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessGetUserInfoImplCopyWith<_$SuccessGetUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessUpdateUserDataImplCopyWith<$Res> {
  factory _$$SuccessUpdateUserDataImplCopyWith(
          _$SuccessUpdateUserDataImpl value,
          $Res Function(_$SuccessUpdateUserDataImpl) then) =
      __$$SuccessUpdateUserDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$SuccessUpdateUserDataImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res, _$SuccessUpdateUserDataImpl>
    implements _$$SuccessUpdateUserDataImplCopyWith<$Res> {
  __$$SuccessUpdateUserDataImplCopyWithImpl(_$SuccessUpdateUserDataImpl _value,
      $Res Function(_$SuccessUpdateUserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SuccessUpdateUserDataImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$SuccessUpdateUserDataImpl implements _SuccessUpdateUserData {
  const _$SuccessUpdateUserDataImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserDataState.successUpdateUserData(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessUpdateUserDataImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessUpdateUserDataImplCopyWith<_$SuccessUpdateUserDataImpl>
      get copyWith => __$$SuccessUpdateUserDataImplCopyWithImpl<
          _$SuccessUpdateUserDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) successGetUserData,
    required TResult Function(User user) successGetUserInfo,
    required TResult Function(User user) successUpdateUserData,
    required TResult Function() successUpdateUserPassword,
    required TResult Function(User user) successUpdateUserProfilePhoto,
    required TResult Function(String message) error,
  }) {
    return successUpdateUserData(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? successGetUserData,
    TResult? Function(User user)? successGetUserInfo,
    TResult? Function(User user)? successUpdateUserData,
    TResult? Function()? successUpdateUserPassword,
    TResult? Function(User user)? successUpdateUserProfilePhoto,
    TResult? Function(String message)? error,
  }) {
    return successUpdateUserData?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? successGetUserData,
    TResult Function(User user)? successGetUserInfo,
    TResult Function(User user)? successUpdateUserData,
    TResult Function()? successUpdateUserPassword,
    TResult Function(User user)? successUpdateUserProfilePhoto,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (successUpdateUserData != null) {
      return successUpdateUserData(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessGetUserData value) successGetUserData,
    required TResult Function(_SuccessGetUserInfo value) successGetUserInfo,
    required TResult Function(_SuccessUpdateUserData value)
        successUpdateUserData,
    required TResult Function(_SuccessUpdateUserPassword value)
        successUpdateUserPassword,
    required TResult Function(_SuccessUpdateUserProfilePhoto value)
        successUpdateUserProfilePhoto,
    required TResult Function(_Error value) error,
  }) {
    return successUpdateUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessGetUserData value)? successGetUserData,
    TResult? Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult? Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult? Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult? Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult? Function(_Error value)? error,
  }) {
    return successUpdateUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessGetUserData value)? successGetUserData,
    TResult Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (successUpdateUserData != null) {
      return successUpdateUserData(this);
    }
    return orElse();
  }
}

abstract class _SuccessUpdateUserData implements UserDataState {
  const factory _SuccessUpdateUserData(final User user) =
      _$SuccessUpdateUserDataImpl;

  User get user;

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessUpdateUserDataImplCopyWith<_$SuccessUpdateUserDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessUpdateUserPasswordImplCopyWith<$Res> {
  factory _$$SuccessUpdateUserPasswordImplCopyWith(
          _$SuccessUpdateUserPasswordImpl value,
          $Res Function(_$SuccessUpdateUserPasswordImpl) then) =
      __$$SuccessUpdateUserPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessUpdateUserPasswordImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res, _$SuccessUpdateUserPasswordImpl>
    implements _$$SuccessUpdateUserPasswordImplCopyWith<$Res> {
  __$$SuccessUpdateUserPasswordImplCopyWithImpl(
      _$SuccessUpdateUserPasswordImpl _value,
      $Res Function(_$SuccessUpdateUserPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessUpdateUserPasswordImpl implements _SuccessUpdateUserPassword {
  const _$SuccessUpdateUserPasswordImpl();

  @override
  String toString() {
    return 'UserDataState.successUpdateUserPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessUpdateUserPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) successGetUserData,
    required TResult Function(User user) successGetUserInfo,
    required TResult Function(User user) successUpdateUserData,
    required TResult Function() successUpdateUserPassword,
    required TResult Function(User user) successUpdateUserProfilePhoto,
    required TResult Function(String message) error,
  }) {
    return successUpdateUserPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? successGetUserData,
    TResult? Function(User user)? successGetUserInfo,
    TResult? Function(User user)? successUpdateUserData,
    TResult? Function()? successUpdateUserPassword,
    TResult? Function(User user)? successUpdateUserProfilePhoto,
    TResult? Function(String message)? error,
  }) {
    return successUpdateUserPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? successGetUserData,
    TResult Function(User user)? successGetUserInfo,
    TResult Function(User user)? successUpdateUserData,
    TResult Function()? successUpdateUserPassword,
    TResult Function(User user)? successUpdateUserProfilePhoto,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (successUpdateUserPassword != null) {
      return successUpdateUserPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessGetUserData value) successGetUserData,
    required TResult Function(_SuccessGetUserInfo value) successGetUserInfo,
    required TResult Function(_SuccessUpdateUserData value)
        successUpdateUserData,
    required TResult Function(_SuccessUpdateUserPassword value)
        successUpdateUserPassword,
    required TResult Function(_SuccessUpdateUserProfilePhoto value)
        successUpdateUserProfilePhoto,
    required TResult Function(_Error value) error,
  }) {
    return successUpdateUserPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessGetUserData value)? successGetUserData,
    TResult? Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult? Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult? Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult? Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult? Function(_Error value)? error,
  }) {
    return successUpdateUserPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessGetUserData value)? successGetUserData,
    TResult Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (successUpdateUserPassword != null) {
      return successUpdateUserPassword(this);
    }
    return orElse();
  }
}

abstract class _SuccessUpdateUserPassword implements UserDataState {
  const factory _SuccessUpdateUserPassword() = _$SuccessUpdateUserPasswordImpl;
}

/// @nodoc
abstract class _$$SuccessUpdateUserProfilePhotoImplCopyWith<$Res> {
  factory _$$SuccessUpdateUserProfilePhotoImplCopyWith(
          _$SuccessUpdateUserProfilePhotoImpl value,
          $Res Function(_$SuccessUpdateUserProfilePhotoImpl) then) =
      __$$SuccessUpdateUserProfilePhotoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$SuccessUpdateUserProfilePhotoImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res,
        _$SuccessUpdateUserProfilePhotoImpl>
    implements _$$SuccessUpdateUserProfilePhotoImplCopyWith<$Res> {
  __$$SuccessUpdateUserProfilePhotoImplCopyWithImpl(
      _$SuccessUpdateUserProfilePhotoImpl _value,
      $Res Function(_$SuccessUpdateUserProfilePhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SuccessUpdateUserProfilePhotoImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$SuccessUpdateUserProfilePhotoImpl
    implements _SuccessUpdateUserProfilePhoto {
  const _$SuccessUpdateUserProfilePhotoImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserDataState.successUpdateUserProfilePhoto(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessUpdateUserProfilePhotoImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessUpdateUserProfilePhotoImplCopyWith<
          _$SuccessUpdateUserProfilePhotoImpl>
      get copyWith => __$$SuccessUpdateUserProfilePhotoImplCopyWithImpl<
          _$SuccessUpdateUserProfilePhotoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) successGetUserData,
    required TResult Function(User user) successGetUserInfo,
    required TResult Function(User user) successUpdateUserData,
    required TResult Function() successUpdateUserPassword,
    required TResult Function(User user) successUpdateUserProfilePhoto,
    required TResult Function(String message) error,
  }) {
    return successUpdateUserProfilePhoto(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? successGetUserData,
    TResult? Function(User user)? successGetUserInfo,
    TResult? Function(User user)? successUpdateUserData,
    TResult? Function()? successUpdateUserPassword,
    TResult? Function(User user)? successUpdateUserProfilePhoto,
    TResult? Function(String message)? error,
  }) {
    return successUpdateUserProfilePhoto?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? successGetUserData,
    TResult Function(User user)? successGetUserInfo,
    TResult Function(User user)? successUpdateUserData,
    TResult Function()? successUpdateUserPassword,
    TResult Function(User user)? successUpdateUserProfilePhoto,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (successUpdateUserProfilePhoto != null) {
      return successUpdateUserProfilePhoto(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessGetUserData value) successGetUserData,
    required TResult Function(_SuccessGetUserInfo value) successGetUserInfo,
    required TResult Function(_SuccessUpdateUserData value)
        successUpdateUserData,
    required TResult Function(_SuccessUpdateUserPassword value)
        successUpdateUserPassword,
    required TResult Function(_SuccessUpdateUserProfilePhoto value)
        successUpdateUserProfilePhoto,
    required TResult Function(_Error value) error,
  }) {
    return successUpdateUserProfilePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessGetUserData value)? successGetUserData,
    TResult? Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult? Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult? Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult? Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult? Function(_Error value)? error,
  }) {
    return successUpdateUserProfilePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessGetUserData value)? successGetUserData,
    TResult Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (successUpdateUserProfilePhoto != null) {
      return successUpdateUserProfilePhoto(this);
    }
    return orElse();
  }
}

abstract class _SuccessUpdateUserProfilePhoto implements UserDataState {
  const factory _SuccessUpdateUserProfilePhoto(final User user) =
      _$SuccessUpdateUserProfilePhotoImpl;

  User get user;

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessUpdateUserProfilePhotoImplCopyWith<
          _$SuccessUpdateUserProfilePhotoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserDataState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) successGetUserData,
    required TResult Function(User user) successGetUserInfo,
    required TResult Function(User user) successUpdateUserData,
    required TResult Function() successUpdateUserPassword,
    required TResult Function(User user) successUpdateUserProfilePhoto,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? successGetUserData,
    TResult? Function(User user)? successGetUserInfo,
    TResult? Function(User user)? successUpdateUserData,
    TResult? Function()? successUpdateUserPassword,
    TResult? Function(User user)? successUpdateUserProfilePhoto,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? successGetUserData,
    TResult Function(User user)? successGetUserInfo,
    TResult Function(User user)? successUpdateUserData,
    TResult Function()? successUpdateUserPassword,
    TResult Function(User user)? successUpdateUserProfilePhoto,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessGetUserData value) successGetUserData,
    required TResult Function(_SuccessGetUserInfo value) successGetUserInfo,
    required TResult Function(_SuccessUpdateUserData value)
        successUpdateUserData,
    required TResult Function(_SuccessUpdateUserPassword value)
        successUpdateUserPassword,
    required TResult Function(_SuccessUpdateUserProfilePhoto value)
        successUpdateUserProfilePhoto,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessGetUserData value)? successGetUserData,
    TResult? Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult? Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult? Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult? Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessGetUserData value)? successGetUserData,
    TResult Function(_SuccessGetUserInfo value)? successGetUserInfo,
    TResult Function(_SuccessUpdateUserData value)? successUpdateUserData,
    TResult Function(_SuccessUpdateUserPassword value)?
        successUpdateUserPassword,
    TResult Function(_SuccessUpdateUserProfilePhoto value)?
        successUpdateUserProfilePhoto,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserDataState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
