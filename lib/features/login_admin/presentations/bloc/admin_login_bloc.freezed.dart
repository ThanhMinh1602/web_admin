// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminLoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() adminLoginInitialEvent,
    required TResult Function(LoginRequest loginRequest) adminLoginlEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? adminLoginInitialEvent,
    TResult? Function(LoginRequest loginRequest)? adminLoginlEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? adminLoginInitialEvent,
    TResult Function(LoginRequest loginRequest)? adminLoginlEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminLoginInitialEvent value)
        adminLoginInitialEvent,
    required TResult Function(AdminLoginEvents value) adminLoginlEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminLoginInitialEvent value)? adminLoginInitialEvent,
    TResult? Function(AdminLoginEvents value)? adminLoginlEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminLoginInitialEvent value)? adminLoginInitialEvent,
    TResult Function(AdminLoginEvents value)? adminLoginlEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminLoginEventCopyWith<$Res> {
  factory $AdminLoginEventCopyWith(
          AdminLoginEvent value, $Res Function(AdminLoginEvent) then) =
      _$AdminLoginEventCopyWithImpl<$Res, AdminLoginEvent>;
}

/// @nodoc
class _$AdminLoginEventCopyWithImpl<$Res, $Val extends AdminLoginEvent>
    implements $AdminLoginEventCopyWith<$Res> {
  _$AdminLoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AdminLoginInitialEventImplCopyWith<$Res> {
  factory _$$AdminLoginInitialEventImplCopyWith(
          _$AdminLoginInitialEventImpl value,
          $Res Function(_$AdminLoginInitialEventImpl) then) =
      __$$AdminLoginInitialEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AdminLoginInitialEventImplCopyWithImpl<$Res>
    extends _$AdminLoginEventCopyWithImpl<$Res, _$AdminLoginInitialEventImpl>
    implements _$$AdminLoginInitialEventImplCopyWith<$Res> {
  __$$AdminLoginInitialEventImplCopyWithImpl(
      _$AdminLoginInitialEventImpl _value,
      $Res Function(_$AdminLoginInitialEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AdminLoginInitialEventImpl implements AdminLoginInitialEvent {
  const _$AdminLoginInitialEventImpl();

  @override
  String toString() {
    return 'AdminLoginEvent.adminLoginInitialEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminLoginInitialEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() adminLoginInitialEvent,
    required TResult Function(LoginRequest loginRequest) adminLoginlEvent,
  }) {
    return adminLoginInitialEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? adminLoginInitialEvent,
    TResult? Function(LoginRequest loginRequest)? adminLoginlEvent,
  }) {
    return adminLoginInitialEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? adminLoginInitialEvent,
    TResult Function(LoginRequest loginRequest)? adminLoginlEvent,
    required TResult orElse(),
  }) {
    if (adminLoginInitialEvent != null) {
      return adminLoginInitialEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminLoginInitialEvent value)
        adminLoginInitialEvent,
    required TResult Function(AdminLoginEvents value) adminLoginlEvent,
  }) {
    return adminLoginInitialEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminLoginInitialEvent value)? adminLoginInitialEvent,
    TResult? Function(AdminLoginEvents value)? adminLoginlEvent,
  }) {
    return adminLoginInitialEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminLoginInitialEvent value)? adminLoginInitialEvent,
    TResult Function(AdminLoginEvents value)? adminLoginlEvent,
    required TResult orElse(),
  }) {
    if (adminLoginInitialEvent != null) {
      return adminLoginInitialEvent(this);
    }
    return orElse();
  }
}

abstract class AdminLoginInitialEvent implements AdminLoginEvent {
  const factory AdminLoginInitialEvent() = _$AdminLoginInitialEventImpl;
}

/// @nodoc
abstract class _$$AdminLoginEventsImplCopyWith<$Res> {
  factory _$$AdminLoginEventsImplCopyWith(_$AdminLoginEventsImpl value,
          $Res Function(_$AdminLoginEventsImpl) then) =
      __$$AdminLoginEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginRequest loginRequest});
}

/// @nodoc
class __$$AdminLoginEventsImplCopyWithImpl<$Res>
    extends _$AdminLoginEventCopyWithImpl<$Res, _$AdminLoginEventsImpl>
    implements _$$AdminLoginEventsImplCopyWith<$Res> {
  __$$AdminLoginEventsImplCopyWithImpl(_$AdminLoginEventsImpl _value,
      $Res Function(_$AdminLoginEventsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginRequest = null,
  }) {
    return _then(_$AdminLoginEventsImpl(
      null == loginRequest
          ? _value.loginRequest
          : loginRequest // ignore: cast_nullable_to_non_nullable
              as LoginRequest,
    ));
  }
}

/// @nodoc

class _$AdminLoginEventsImpl implements AdminLoginEvents {
  const _$AdminLoginEventsImpl(this.loginRequest);

  @override
  final LoginRequest loginRequest;

  @override
  String toString() {
    return 'AdminLoginEvent.adminLoginlEvent(loginRequest: $loginRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminLoginEventsImpl &&
            (identical(other.loginRequest, loginRequest) ||
                other.loginRequest == loginRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminLoginEventsImplCopyWith<_$AdminLoginEventsImpl> get copyWith =>
      __$$AdminLoginEventsImplCopyWithImpl<_$AdminLoginEventsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() adminLoginInitialEvent,
    required TResult Function(LoginRequest loginRequest) adminLoginlEvent,
  }) {
    return adminLoginlEvent(loginRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? adminLoginInitialEvent,
    TResult? Function(LoginRequest loginRequest)? adminLoginlEvent,
  }) {
    return adminLoginlEvent?.call(loginRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? adminLoginInitialEvent,
    TResult Function(LoginRequest loginRequest)? adminLoginlEvent,
    required TResult orElse(),
  }) {
    if (adminLoginlEvent != null) {
      return adminLoginlEvent(loginRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdminLoginInitialEvent value)
        adminLoginInitialEvent,
    required TResult Function(AdminLoginEvents value) adminLoginlEvent,
  }) {
    return adminLoginlEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AdminLoginInitialEvent value)? adminLoginInitialEvent,
    TResult? Function(AdminLoginEvents value)? adminLoginlEvent,
  }) {
    return adminLoginlEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdminLoginInitialEvent value)? adminLoginInitialEvent,
    TResult Function(AdminLoginEvents value)? adminLoginlEvent,
    required TResult orElse(),
  }) {
    if (adminLoginlEvent != null) {
      return adminLoginlEvent(this);
    }
    return orElse();
  }
}

abstract class AdminLoginEvents implements AdminLoginEvent {
  const factory AdminLoginEvents(final LoginRequest loginRequest) =
      _$AdminLoginEventsImpl;

  LoginRequest get loginRequest;
  @JsonKey(ignore: true)
  _$$AdminLoginEventsImplCopyWith<_$AdminLoginEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdminLoginState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminLoginStateCopyWith<AdminLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminLoginStateCopyWith<$Res> {
  factory $AdminLoginStateCopyWith(
          AdminLoginState value, $Res Function(AdminLoginState) then) =
      _$AdminLoginStateCopyWithImpl<$Res, AdminLoginState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AdminLoginStateCopyWithImpl<$Res, $Val extends AdminLoginState>
    implements $AdminLoginStateCopyWith<$Res> {
  _$AdminLoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminLoginStateImplCopyWith<$Res>
    implements $AdminLoginStateCopyWith<$Res> {
  factory _$$AdminLoginStateImplCopyWith(_$AdminLoginStateImpl value,
          $Res Function(_$AdminLoginStateImpl) then) =
      __$$AdminLoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$AdminLoginStateImplCopyWithImpl<$Res>
    extends _$AdminLoginStateCopyWithImpl<$Res, _$AdminLoginStateImpl>
    implements _$$AdminLoginStateImplCopyWith<$Res> {
  __$$AdminLoginStateImplCopyWithImpl(
      _$AdminLoginStateImpl _value, $Res Function(_$AdminLoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$AdminLoginStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AdminLoginStateImpl implements _AdminLoginState {
  const _$AdminLoginStateImpl({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AdminLoginState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminLoginStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminLoginStateImplCopyWith<_$AdminLoginStateImpl> get copyWith =>
      __$$AdminLoginStateImplCopyWithImpl<_$AdminLoginStateImpl>(
          this, _$identity);
}

abstract class _AdminLoginState implements AdminLoginState {
  const factory _AdminLoginState({final bool isLoading}) =
      _$AdminLoginStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AdminLoginStateImplCopyWith<_$AdminLoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
