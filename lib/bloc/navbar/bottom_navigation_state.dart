part of 'bottom_navigation_cubit.dart';

@freezed
abstract class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState.initial() = _Initial;
  const factory BottomNavigationState.changedIndex({required int index}) =
      _ChangedIndex;
}
