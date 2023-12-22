// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LearningState {
  bool get isInError => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  bool get isInInsightProgress => throw _privateConstructorUsedError;
  bool get isInElearningProgress => throw _privateConstructorUsedError;
  List<ItemContentUiModel>? get insightList =>
      throw _privateConstructorUsedError;
  List<ItemContentUiModel>? get elearningList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LearningStateCopyWith<LearningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningStateCopyWith<$Res> {
  factory $LearningStateCopyWith(
          LearningState value, $Res Function(LearningState) then) =
      _$LearningStateCopyWithImpl<$Res, LearningState>;
  @useResult
  $Res call(
      {bool isInError,
      String errorMsg,
      bool isInInsightProgress,
      bool isInElearningProgress,
      List<ItemContentUiModel>? insightList,
      List<ItemContentUiModel>? elearningList});
}

/// @nodoc
class _$LearningStateCopyWithImpl<$Res, $Val extends LearningState>
    implements $LearningStateCopyWith<$Res> {
  _$LearningStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInError = null,
    Object? errorMsg = null,
    Object? isInInsightProgress = null,
    Object? isInElearningProgress = null,
    Object? insightList = freezed,
    Object? elearningList = freezed,
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
      isInInsightProgress: null == isInInsightProgress
          ? _value.isInInsightProgress
          : isInInsightProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isInElearningProgress: null == isInElearningProgress
          ? _value.isInElearningProgress
          : isInElearningProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      insightList: freezed == insightList
          ? _value.insightList
          : insightList // ignore: cast_nullable_to_non_nullable
              as List<ItemContentUiModel>?,
      elearningList: freezed == elearningList
          ? _value.elearningList
          : elearningList // ignore: cast_nullable_to_non_nullable
              as List<ItemContentUiModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearnigStateImplCopyWith<$Res>
    implements $LearningStateCopyWith<$Res> {
  factory _$$LearnigStateImplCopyWith(
          _$LearnigStateImpl value, $Res Function(_$LearnigStateImpl) then) =
      __$$LearnigStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInError,
      String errorMsg,
      bool isInInsightProgress,
      bool isInElearningProgress,
      List<ItemContentUiModel>? insightList,
      List<ItemContentUiModel>? elearningList});
}

/// @nodoc
class __$$LearnigStateImplCopyWithImpl<$Res>
    extends _$LearningStateCopyWithImpl<$Res, _$LearnigStateImpl>
    implements _$$LearnigStateImplCopyWith<$Res> {
  __$$LearnigStateImplCopyWithImpl(
      _$LearnigStateImpl _value, $Res Function(_$LearnigStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInError = null,
    Object? errorMsg = null,
    Object? isInInsightProgress = null,
    Object? isInElearningProgress = null,
    Object? insightList = freezed,
    Object? elearningList = freezed,
  }) {
    return _then(_$LearnigStateImpl(
      isInError: null == isInError
          ? _value.isInError
          : isInError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      isInInsightProgress: null == isInInsightProgress
          ? _value.isInInsightProgress
          : isInInsightProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isInElearningProgress: null == isInElearningProgress
          ? _value.isInElearningProgress
          : isInElearningProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      insightList: freezed == insightList
          ? _value._insightList
          : insightList // ignore: cast_nullable_to_non_nullable
              as List<ItemContentUiModel>?,
      elearningList: freezed == elearningList
          ? _value._elearningList
          : elearningList // ignore: cast_nullable_to_non_nullable
              as List<ItemContentUiModel>?,
    ));
  }
}

/// @nodoc

class _$LearnigStateImpl implements _LearnigState {
  const _$LearnigStateImpl(
      {required this.isInError,
      required this.errorMsg,
      required this.isInInsightProgress,
      required this.isInElearningProgress,
      required final List<ItemContentUiModel>? insightList,
      required final List<ItemContentUiModel>? elearningList})
      : _insightList = insightList,
        _elearningList = elearningList;

  @override
  final bool isInError;
  @override
  final String errorMsg;
  @override
  final bool isInInsightProgress;
  @override
  final bool isInElearningProgress;
  final List<ItemContentUiModel>? _insightList;
  @override
  List<ItemContentUiModel>? get insightList {
    final value = _insightList;
    if (value == null) return null;
    if (_insightList is EqualUnmodifiableListView) return _insightList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ItemContentUiModel>? _elearningList;
  @override
  List<ItemContentUiModel>? get elearningList {
    final value = _elearningList;
    if (value == null) return null;
    if (_elearningList is EqualUnmodifiableListView) return _elearningList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LearningState(isInError: $isInError, errorMsg: $errorMsg, isInInsightProgress: $isInInsightProgress, isInElearningProgress: $isInElearningProgress, insightList: $insightList, elearningList: $elearningList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearnigStateImpl &&
            (identical(other.isInError, isInError) ||
                other.isInError == isInError) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.isInInsightProgress, isInInsightProgress) ||
                other.isInInsightProgress == isInInsightProgress) &&
            (identical(other.isInElearningProgress, isInElearningProgress) ||
                other.isInElearningProgress == isInElearningProgress) &&
            const DeepCollectionEquality()
                .equals(other._insightList, _insightList) &&
            const DeepCollectionEquality()
                .equals(other._elearningList, _elearningList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isInError,
      errorMsg,
      isInInsightProgress,
      isInElearningProgress,
      const DeepCollectionEquality().hash(_insightList),
      const DeepCollectionEquality().hash(_elearningList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearnigStateImplCopyWith<_$LearnigStateImpl> get copyWith =>
      __$$LearnigStateImplCopyWithImpl<_$LearnigStateImpl>(this, _$identity);
}

abstract class _LearnigState implements LearningState {
  const factory _LearnigState(
          {required final bool isInError,
          required final String errorMsg,
          required final bool isInInsightProgress,
          required final bool isInElearningProgress,
          required final List<ItemContentUiModel>? insightList,
          required final List<ItemContentUiModel>? elearningList}) =
      _$LearnigStateImpl;

  @override
  bool get isInError;
  @override
  String get errorMsg;
  @override
  bool get isInInsightProgress;
  @override
  bool get isInElearningProgress;
  @override
  List<ItemContentUiModel>? get insightList;
  @override
  List<ItemContentUiModel>? get elearningList;
  @override
  @JsonKey(ignore: true)
  _$$LearnigStateImplCopyWith<_$LearnigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
