import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:uuid/uuid.dart';

part 'recipe_step.freezed.dart';
part 'recipe_step.g.dart';

@freezed
class RecipeStep with _$RecipeStep {
  @HiveType(typeId: 2, adapterName: 'RecipeStepAdapter')
  factory RecipeStep({
    @HiveField(0) required String id,
    @HiveField(1) required String recipeId,
    @HiveField(2) required String content,
    @HiveField(3) @Default(<String, int>{}) Map<String, int> timers,
    @HiveField(4) @Default(<String>[]) List<String> ingredients,
  }) = _RecipeStep;

  factory RecipeStep.withId({
    required String recipeId,
    required String content,
    Map<String, int>? timers,
    List<String> ingredients = const <String>[],
  }) {
    return RecipeStep(
      id: const Uuid().v1(),
      recipeId: recipeId,
      content: content,
      timers: timers ?? <String, int>{},
      ingredients: ingredients,
    );
  }

  factory RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepFromJson(json);
}

extension RecipeStepExtension on RecipeStep {
  String timerDesc(int timer) =>
      timer > 0 ? '$timer ${Strings.min}' : Strings.noTimerSet;

  String get timersDesc => timers.isNotEmpty
      ? timers.values.map(timerDesc).toList().join(', ')
      : Strings.noTimerSet;

  String get ingredientsDesc => '${Strings.ingredients}: ${ingredients.length}';

  String get stepInfoDesc => '${Strings.timer}: $timersDesc\n$ingredientsDesc';
}
