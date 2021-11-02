import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';

part 'planner.freezed.dart';
part 'planner.g.dart';

@freezed
class PlannerDay with _$PlannerDay {
  @HiveType(typeId: 3, adapterName: 'PlannerDayAdapter')
  factory PlannerDay({
    @HiveField(0) String? id,
    @HiveField(1) required DateTime date,
    @HiveField(2) required List<Recipe> dishes,
  }) = _PlannerDay;

  factory PlannerDay.fromJson(Map<String, dynamic> json) =>
      _$PlannerDayFromJson(json);
}