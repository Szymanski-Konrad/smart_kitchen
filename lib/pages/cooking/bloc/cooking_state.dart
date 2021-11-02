import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';

part 'cooking_state.freezed.dart';

enum CookingStatus { prepare, steps, summary }

@freezed
class CookingState with _$CookingState {
  factory CookingState({
    required Recipe recipe,
    required double scale,
    required DateTime startTime,
    required DateTime endTime,
    @Default(0) int step,
    @Default(<String, int>{}) Map<String, int> timers,
    @Default(CookingStatus.prepare) CookingStatus status,
    @Default(<bool>[]) List<bool> checkedList,
  }) = _CookingState;

  static CookingState initial(Recipe recipe, double scale) => CookingState(
        recipe: recipe,
        scale: scale,
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        checkedList: List.filled(recipe.ingredients.length, false),
      );
}

extension CookingStateExtension on CookingState {
  String scaledIngredient(int index) =>
      recipe.ingredients[index].showScaled(scale);

  bool get isAllChecked => checkedList.every((element) => element == true);
  bool get isLastStep => step == recipe.steps.length - 1;

  bool get isReadyToEnd => isLastStep && timers.isEmpty;

  String get stepState => Strings.stepState(step + 1, recipe.steps.length);
  String get stepContent => recipe.steps[step].content;

  int get stepIngredientsLength => recipe.steps[step].ingredients.length;

  List<String> get stepIngredientsId => recipe.steps[step].ingredients;
  List<Ingredient> get stepIngredients => recipe.ingredients
      .where((element) => stepIngredientsId.contains(element.id))
      .toList();

  Duration get cookTime => endTime.difference(startTime);

  Map<String, int> get stepTimers => recipe.steps[step].timers;

  String timerString(String uid) =>
      Duration(seconds: timers[uid]!).toString().substring(0, 7);
}
