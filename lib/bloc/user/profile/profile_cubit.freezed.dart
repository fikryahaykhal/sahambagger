// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileState {
  bool get isInError => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  bool get isInProgress => throw _privateConstructorUsedError;
  UserUiModel? get data => throw _privateConstructorUsedError;
  bool get isInSignOut => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {bool isInError,
      String errorMsg,
      bool isInProgress,
      UserUiModel? data,
      bool isInSignOut});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInError = null,
    Object? errorMsg = null,
    Object? isInProgress = null,
    Object? data = freezed,
    Object? isInSignOut = null,
  }) {
    return _then(_value.copyWith(
      isInError: null == isInError
          ? _value.isInError
          : isInError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      isInProgress: null == isInProgress
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserUiModel?,
      isInSignOut: null == isInSignOut
          ? _value.isInSignOut
          : isInSignOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInError,
      String errorMsg,
      bool isInProgress,
      UserUiModel? data,
      bool isInSignOut});
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInError = null,
    Object? errorMsg = null,
    Object? isInProgress = null,
    Object? data = freezed,
    Object? isInSignOut = null,
  }) {
    return _then(_$ProfileStateImpl(
      isInError: null == isInError
          ? _value.isInError
          : isInError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      isInProgress: null == isInProgress
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserUiModel?,
      isInSignOut: null == isInSignOut
          ? _value.isInSignOut
          : isInSignOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl extends _ProfileState {
  _$ProfileStateImpl(
      {required this.isInError,
      required this.errorMsg,
      required this.isInProgress,
      required this.data,
      required this.isInSignOut})
      : super._();

  @override
  final bool isInError;
  @override
  final String errorMsg;
  @override
  final bool isInProgress;
  @override
  final UserUiModel? data;
  @override
  final bool isInSignOut;

  @override
  String toString() {
    return 'ProfileState(isInError: $isInError, errorMsg: $errorMsg, isInProgress: $isInProgress, data: $data, isInSignOut: $isInSignOut)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.isInError, isInError) ||
                other.isInError == isInError) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.isInProgress, isInProgress) ||
                other.isInProgress == isInProgress) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isInSignOut, isInSignOut) ||
                other.isInSignOut == isInSignOut));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isInError, errorMsg, isInProgress, data, isInSignOut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState extends ProfileState {
  factory _ProfileState(
      {required final bool isInError,
      required final String errorMsg,
      required final bool isInProgress,
      required final UserUiModel? data,
      required final bool isInSignOut}) = _$ProfileStateImpl;
  _ProfileState._() : super._();

  @override
  bool get isInError;
  @override
  String get errorMsg;
  @override
  bool get isInProgress;
  @override
  UserUiModel? get data;
  @override
  bool get isInSignOut;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
