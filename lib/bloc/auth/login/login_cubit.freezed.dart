// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isInError => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  bool? get isLoggedIn => throw _privateConstructorUsedError;
  bool get isInProgress => throw _privateConstructorUsedError;
  bool? get isInEmailValid => throw _privateConstructorUsedError;
  bool? get isInEmailFormat => throw _privateConstructorUsedError;
  bool? get isInPasswordValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {String email,
      String password,
      bool isInError,
      String errorMsg,
      bool? isLoggedIn,
      bool isInProgress,
      bool? isInEmailValid,
      bool? isInEmailFormat,
      bool? isInPasswordValid});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isInError = null,
    Object? errorMsg = null,
    Object? isLoggedIn = freezed,
    Object? isInProgress = null,
    Object? isInEmailValid = freezed,
    Object? isInEmailFormat = freezed,
    Object? isInPasswordValid = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isInError: null == isInError
          ? _value.isInError
          : isInError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedIn: freezed == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInProgress: null == isInProgress
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isInEmailValid: freezed == isInEmailValid
          ? _value.isInEmailValid
          : isInEmailValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInEmailFormat: freezed == isInEmailFormat
          ? _value.isInEmailFormat
          : isInEmailFormat // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInPasswordValid: freezed == isInPasswordValid
          ? _value.isInPasswordValid
          : isInPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      bool isInError,
      String errorMsg,
      bool? isLoggedIn,
      bool isInProgress,
      bool? isInEmailValid,
      bool? isInEmailFormat,
      bool? isInPasswordValid});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isInError = null,
    Object? errorMsg = null,
    Object? isLoggedIn = freezed,
    Object? isInProgress = null,
    Object? isInEmailValid = freezed,
    Object? isInEmailFormat = freezed,
    Object? isInPasswordValid = freezed,
  }) {
    return _then(_$LoginStateImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isInError: null == isInError
          ? _value.isInError
          : isInError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedIn: freezed == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInProgress: null == isInProgress
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isInEmailValid: freezed == isInEmailValid
          ? _value.isInEmailValid
          : isInEmailValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInEmailFormat: freezed == isInEmailFormat
          ? _value.isInEmailFormat
          : isInEmailFormat // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInPasswordValid: freezed == isInPasswordValid
          ? _value.isInPasswordValid
          : isInPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl extends _LoginState {
  _$LoginStateImpl(
      {required this.email,
      required this.password,
      required this.isInError,
      required this.errorMsg,
      required this.isLoggedIn,
      required this.isInProgress,
      required this.isInEmailValid,
      required this.isInEmailFormat,
      required this.isInPasswordValid})
      : super._();

  @override
  final String email;
  @override
  final String password;
  @override
  final bool isInError;
  @override
  final String errorMsg;
  @override
  final bool? isLoggedIn;
  @override
  final bool isInProgress;
  @override
  final bool? isInEmailValid;
  @override
  final bool? isInEmailFormat;
  @override
  final bool? isInPasswordValid;

  @override
  String toString() {
    return 'LoginState(email: $email, password: $password, isInError: $isInError, errorMsg: $errorMsg, isLoggedIn: $isLoggedIn, isInProgress: $isInProgress, isInEmailValid: $isInEmailValid, isInEmailFormat: $isInEmailFormat, isInPasswordValid: $isInPasswordValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isInError, isInError) ||
                other.isInError == isInError) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.isInProgress, isInProgress) ||
                other.isInProgress == isInProgress) &&
            (identical(other.isInEmailValid, isInEmailValid) ||
                other.isInEmailValid == isInEmailValid) &&
            (identical(other.isInEmailFormat, isInEmailFormat) ||
                other.isInEmailFormat == isInEmailFormat) &&
            (identical(other.isInPasswordValid, isInPasswordValid) ||
                other.isInPasswordValid == isInPasswordValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      password,
      isInError,
      errorMsg,
      isLoggedIn,
      isInProgress,
      isInEmailValid,
      isInEmailFormat,
      isInPasswordValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  factory _LoginState(
      {required final String email,
      required final String password,
      required final bool isInError,
      required final String errorMsg,
      required final bool? isLoggedIn,
      required final bool isInProgress,
      required final bool? isInEmailValid,
      required final bool? isInEmailFormat,
      required final bool? isInPasswordValid}) = _$LoginStateImpl;
  _LoginState._() : super._();

  @override
  String get email;
  @override
  String get password;
  @override
  bool get isInError;
  @override
  String get errorMsg;
  @override
  bool? get isLoggedIn;
  @override
  bool get isInProgress;
  @override
  bool? get isInEmailValid;
  @override
  bool? get isInEmailFormat;
  @override
  bool? get isInPasswordValid;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
