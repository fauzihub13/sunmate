// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VendorListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllVendor,
    required TResult Function(String vendorId) getDetailVendor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllVendor,
    TResult? Function(String vendorId)? getDetailVendor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllVendor,
    TResult Function(String vendorId)? getDetailVendor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllVendor value) getAllVendor,
    required TResult Function(_GetDetailVendor value) getDetailVendor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllVendor value)? getAllVendor,
    TResult? Function(_GetDetailVendor value)? getDetailVendor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllVendor value)? getAllVendor,
    TResult Function(_GetDetailVendor value)? getDetailVendor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorListEventCopyWith<$Res> {
  factory $VendorListEventCopyWith(
          VendorListEvent value, $Res Function(VendorListEvent) then) =
      _$VendorListEventCopyWithImpl<$Res, VendorListEvent>;
}

/// @nodoc
class _$VendorListEventCopyWithImpl<$Res, $Val extends VendorListEvent>
    implements $VendorListEventCopyWith<$Res> {
  _$VendorListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorListEvent
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
    extends _$VendorListEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'VendorListEvent.started()';
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
    required TResult Function() getAllVendor,
    required TResult Function(String vendorId) getDetailVendor,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllVendor,
    TResult? Function(String vendorId)? getDetailVendor,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllVendor,
    TResult Function(String vendorId)? getDetailVendor,
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
    required TResult Function(_GetAllVendor value) getAllVendor,
    required TResult Function(_GetDetailVendor value) getDetailVendor,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllVendor value)? getAllVendor,
    TResult? Function(_GetDetailVendor value)? getDetailVendor,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllVendor value)? getAllVendor,
    TResult Function(_GetDetailVendor value)? getDetailVendor,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VendorListEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetAllVendorImplCopyWith<$Res> {
  factory _$$GetAllVendorImplCopyWith(
          _$GetAllVendorImpl value, $Res Function(_$GetAllVendorImpl) then) =
      __$$GetAllVendorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllVendorImplCopyWithImpl<$Res>
    extends _$VendorListEventCopyWithImpl<$Res, _$GetAllVendorImpl>
    implements _$$GetAllVendorImplCopyWith<$Res> {
  __$$GetAllVendorImplCopyWithImpl(
      _$GetAllVendorImpl _value, $Res Function(_$GetAllVendorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetAllVendorImpl implements _GetAllVendor {
  const _$GetAllVendorImpl();

  @override
  String toString() {
    return 'VendorListEvent.getAllVendor()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllVendorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllVendor,
    required TResult Function(String vendorId) getDetailVendor,
  }) {
    return getAllVendor();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllVendor,
    TResult? Function(String vendorId)? getDetailVendor,
  }) {
    return getAllVendor?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllVendor,
    TResult Function(String vendorId)? getDetailVendor,
    required TResult orElse(),
  }) {
    if (getAllVendor != null) {
      return getAllVendor();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllVendor value) getAllVendor,
    required TResult Function(_GetDetailVendor value) getDetailVendor,
  }) {
    return getAllVendor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllVendor value)? getAllVendor,
    TResult? Function(_GetDetailVendor value)? getDetailVendor,
  }) {
    return getAllVendor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllVendor value)? getAllVendor,
    TResult Function(_GetDetailVendor value)? getDetailVendor,
    required TResult orElse(),
  }) {
    if (getAllVendor != null) {
      return getAllVendor(this);
    }
    return orElse();
  }
}

abstract class _GetAllVendor implements VendorListEvent {
  const factory _GetAllVendor() = _$GetAllVendorImpl;
}

/// @nodoc
abstract class _$$GetDetailVendorImplCopyWith<$Res> {
  factory _$$GetDetailVendorImplCopyWith(_$GetDetailVendorImpl value,
          $Res Function(_$GetDetailVendorImpl) then) =
      __$$GetDetailVendorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String vendorId});
}

/// @nodoc
class __$$GetDetailVendorImplCopyWithImpl<$Res>
    extends _$VendorListEventCopyWithImpl<$Res, _$GetDetailVendorImpl>
    implements _$$GetDetailVendorImplCopyWith<$Res> {
  __$$GetDetailVendorImplCopyWithImpl(
      _$GetDetailVendorImpl _value, $Res Function(_$GetDetailVendorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorId = null,
  }) {
    return _then(_$GetDetailVendorImpl(
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetDetailVendorImpl implements _GetDetailVendor {
  const _$GetDetailVendorImpl({required this.vendorId});

  @override
  final String vendorId;

  @override
  String toString() {
    return 'VendorListEvent.getDetailVendor(vendorId: $vendorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailVendorImpl &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vendorId);

  /// Create a copy of VendorListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailVendorImplCopyWith<_$GetDetailVendorImpl> get copyWith =>
      __$$GetDetailVendorImplCopyWithImpl<_$GetDetailVendorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllVendor,
    required TResult Function(String vendorId) getDetailVendor,
  }) {
    return getDetailVendor(vendorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllVendor,
    TResult? Function(String vendorId)? getDetailVendor,
  }) {
    return getDetailVendor?.call(vendorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllVendor,
    TResult Function(String vendorId)? getDetailVendor,
    required TResult orElse(),
  }) {
    if (getDetailVendor != null) {
      return getDetailVendor(vendorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllVendor value) getAllVendor,
    required TResult Function(_GetDetailVendor value) getDetailVendor,
  }) {
    return getDetailVendor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllVendor value)? getAllVendor,
    TResult? Function(_GetDetailVendor value)? getDetailVendor,
  }) {
    return getDetailVendor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllVendor value)? getAllVendor,
    TResult Function(_GetDetailVendor value)? getDetailVendor,
    required TResult orElse(),
  }) {
    if (getDetailVendor != null) {
      return getDetailVendor(this);
    }
    return orElse();
  }
}

abstract class _GetDetailVendor implements VendorListEvent {
  const factory _GetDetailVendor({required final String vendorId}) =
      _$GetDetailVendorImpl;

  String get vendorId;

  /// Create a copy of VendorListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetDetailVendorImplCopyWith<_$GetDetailVendorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VendorListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SingleVendor> vendor) loaded,
    required TResult Function(SingleVendor vendor) detailVendorLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SingleVendor> vendor)? loaded,
    TResult? Function(SingleVendor vendor)? detailVendorLoaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SingleVendor> vendor)? loaded,
    TResult Function(SingleVendor vendor)? detailVendorLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailVendorLoaded value) detailVendorLoaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorListStateCopyWith<$Res> {
  factory $VendorListStateCopyWith(
          VendorListState value, $Res Function(VendorListState) then) =
      _$VendorListStateCopyWithImpl<$Res, VendorListState>;
}

/// @nodoc
class _$VendorListStateCopyWithImpl<$Res, $Val extends VendorListState>
    implements $VendorListStateCopyWith<$Res> {
  _$VendorListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorListState
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
    extends _$VendorListStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'VendorListState.initial()';
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
    required TResult Function(List<SingleVendor> vendor) loaded,
    required TResult Function(SingleVendor vendor) detailVendorLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SingleVendor> vendor)? loaded,
    TResult? Function(SingleVendor vendor)? detailVendorLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SingleVendor> vendor)? loaded,
    TResult Function(SingleVendor vendor)? detailVendorLoaded,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailVendorLoaded value) detailVendorLoaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VendorListState {
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
    extends _$VendorListStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'VendorListState.loading()';
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
    required TResult Function(List<SingleVendor> vendor) loaded,
    required TResult Function(SingleVendor vendor) detailVendorLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SingleVendor> vendor)? loaded,
    TResult? Function(SingleVendor vendor)? detailVendorLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SingleVendor> vendor)? loaded,
    TResult Function(SingleVendor vendor)? detailVendorLoaded,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailVendorLoaded value) detailVendorLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VendorListState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SingleVendor> vendor});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$VendorListStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = null,
  }) {
    return _then(_$LoadedImpl(
      null == vendor
          ? _value._vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as List<SingleVendor>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<SingleVendor> vendor) : _vendor = vendor;

  final List<SingleVendor> _vendor;
  @override
  List<SingleVendor> get vendor {
    if (_vendor is EqualUnmodifiableListView) return _vendor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vendor);
  }

  @override
  String toString() {
    return 'VendorListState.loaded(vendor: $vendor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._vendor, _vendor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_vendor));

  /// Create a copy of VendorListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SingleVendor> vendor) loaded,
    required TResult Function(SingleVendor vendor) detailVendorLoaded,
    required TResult Function(String message) error,
  }) {
    return loaded(vendor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SingleVendor> vendor)? loaded,
    TResult? Function(SingleVendor vendor)? detailVendorLoaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(vendor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SingleVendor> vendor)? loaded,
    TResult Function(SingleVendor vendor)? detailVendorLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(vendor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailVendorLoaded value) detailVendorLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements VendorListState {
  const factory _Loaded(final List<SingleVendor> vendor) = _$LoadedImpl;

  List<SingleVendor> get vendor;

  /// Create a copy of VendorListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailVendorLoadedImplCopyWith<$Res> {
  factory _$$DetailVendorLoadedImplCopyWith(_$DetailVendorLoadedImpl value,
          $Res Function(_$DetailVendorLoadedImpl) then) =
      __$$DetailVendorLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SingleVendor vendor});
}

/// @nodoc
class __$$DetailVendorLoadedImplCopyWithImpl<$Res>
    extends _$VendorListStateCopyWithImpl<$Res, _$DetailVendorLoadedImpl>
    implements _$$DetailVendorLoadedImplCopyWith<$Res> {
  __$$DetailVendorLoadedImplCopyWithImpl(_$DetailVendorLoadedImpl _value,
      $Res Function(_$DetailVendorLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendor = null,
  }) {
    return _then(_$DetailVendorLoadedImpl(
      null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as SingleVendor,
    ));
  }
}

/// @nodoc

class _$DetailVendorLoadedImpl implements _DetailVendorLoaded {
  const _$DetailVendorLoadedImpl(this.vendor);

  @override
  final SingleVendor vendor;

  @override
  String toString() {
    return 'VendorListState.detailVendorLoaded(vendor: $vendor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailVendorLoadedImpl &&
            (identical(other.vendor, vendor) || other.vendor == vendor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vendor);

  /// Create a copy of VendorListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailVendorLoadedImplCopyWith<_$DetailVendorLoadedImpl> get copyWith =>
      __$$DetailVendorLoadedImplCopyWithImpl<_$DetailVendorLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SingleVendor> vendor) loaded,
    required TResult Function(SingleVendor vendor) detailVendorLoaded,
    required TResult Function(String message) error,
  }) {
    return detailVendorLoaded(vendor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SingleVendor> vendor)? loaded,
    TResult? Function(SingleVendor vendor)? detailVendorLoaded,
    TResult? Function(String message)? error,
  }) {
    return detailVendorLoaded?.call(vendor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SingleVendor> vendor)? loaded,
    TResult Function(SingleVendor vendor)? detailVendorLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (detailVendorLoaded != null) {
      return detailVendorLoaded(vendor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailVendorLoaded value) detailVendorLoaded,
    required TResult Function(_Error value) error,
  }) {
    return detailVendorLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return detailVendorLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (detailVendorLoaded != null) {
      return detailVendorLoaded(this);
    }
    return orElse();
  }
}

abstract class _DetailVendorLoaded implements VendorListState {
  const factory _DetailVendorLoaded(final SingleVendor vendor) =
      _$DetailVendorLoadedImpl;

  SingleVendor get vendor;

  /// Create a copy of VendorListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailVendorLoadedImplCopyWith<_$DetailVendorLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$VendorListStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VendorListState
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
    return 'VendorListState.error(message: $message)';
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

  /// Create a copy of VendorListState
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
    required TResult Function(List<SingleVendor> vendor) loaded,
    required TResult Function(SingleVendor vendor) detailVendorLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SingleVendor> vendor)? loaded,
    TResult? Function(SingleVendor vendor)? detailVendorLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SingleVendor> vendor)? loaded,
    TResult Function(SingleVendor vendor)? detailVendorLoaded,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_DetailVendorLoaded value) detailVendorLoaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_DetailVendorLoaded value)? detailVendorLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VendorListState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of VendorListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
