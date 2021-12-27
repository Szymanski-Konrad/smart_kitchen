import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_kitchen/models/planner/planner.dart';

part 'planner_state.freezed.dart';

@freezed
class PlannerState with _$PlannerState {
  factory PlannerState({
    required DateTime selectedDate,
    @Default(false) bool isLoading,
    @Default(false) bool isGenerating,
    @Default(<DateTime>[]) List<DateTime> markedDays,
    required PlannerDay day,
  }) = _PlannerState;

  static PlannerState initial(DateTime selectedDate) => PlannerState(
        selectedDate: selectedDate,
        day: PlannerDay.empty(selectedDate),
      );
}
