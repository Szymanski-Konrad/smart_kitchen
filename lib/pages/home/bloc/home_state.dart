import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required int currentIndex,
  }) = _HomeState;

  static HomeState get initial => const HomeState(currentIndex: 1);
}
