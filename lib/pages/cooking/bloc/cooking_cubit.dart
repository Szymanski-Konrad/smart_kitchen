import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/pages/cooking/bloc/cooking_state.dart';
import 'package:smart_kitchen/utils/step_timer.dart';

class CookingCubit extends Cubit<CookingState> {
  CookingCubit({
    required Recipe recipe,
    required double scale,
  }) : super(CookingState.initial(recipe, scale));

  final StepTimer _ticker = StepTimer();
  final _tickerSubscriptions = <String, StreamSubscription<int>>{};

  bool isTimerInit(String uid) =>
      _tickerSubscriptions.containsKey(uid) && !isTimerPaused(uid);
  bool isTimerPaused(String uid) =>
      _tickerSubscriptions[uid]?.isPaused ?? false;

  void addTimer(String uid, int timer) {
    final timers = Map<String, int>.from(state.timers)
      ..addAll({uid: timer * 60});
    emit(state.copyWith(timers: timers));
    runTimer(uid);
  }

  void updateTimer(String uid, int left) {
    final timers = Map<String, int>.from(state.timers);
    left == 0 ? timers.remove(uid) : timers[uid] = left;
    emit(state.copyWith(timers: timers));
  }

  void runTimer(String uid) {
    _tickerSubscriptions[uid]?.cancel();
    _tickerSubscriptions.addAll({
      uid: _ticker
          .secondTicker(ticks: state.timers[uid]!)
          .listen((left) => updateTimer(uid, left))
    });
  }

  void stopTimer(String uid) {
    _tickerSubscriptions[uid]?.cancel();
  }

  void pauseTimer(String uid) {
    _tickerSubscriptions[uid]!.isPaused
        ? _tickerSubscriptions[uid]?.resume()
        : _tickerSubscriptions[uid]?.pause();
  }

  void addMinuteToTimer(String uid) {
    final timers = Map<String, int>.from(state.timers);
    final timer = (timers[uid] ?? 0) + 60;
    timers[uid] = timer;
    emit(state.copyWith(timers: timers));
    runTimer(uid);
  }

  void checkIngredient(int index, bool value) {
    final list = List<bool>.from(state.checkedList);
    list[index] = value;
    emit(state.copyWith(checkedList: list));
  }

  void endPreparation() {
    emit(state.copyWith(
      status: CookingStatus.steps,
      step: 0,
      checkedList: List.filled(state.recipe.steps[0].ingredients.length, false),
    ));
  }

  void nextStep() {
    final nextStep = state.step + 1;
    emit(state.copyWith(
      step: nextStep,
      checkedList:
          List.filled(state.recipe.steps[nextStep].ingredients.length, false),
    ));
  }

  void endSteps() {
    emit(state.copyWith(
      status: CookingStatus.summary,
      endTime: DateTime.now(),
    ));
  }

  void closeCooking() {
    Navigation.instance.pop();
  }

  @override
  Future<void> close() async {
    for (final sub in _tickerSubscriptions.values) {
      sub.cancel();
    }
    super.close();
  }
}
