import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/resources/constants.dart';
import 'package:smart_kitchen/features/hive/hive_database.dart';
import 'package:smart_kitchen/models/planner/planner.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/pages/planner/bloc/planner_state.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_cubit.dart';
import 'package:smart_kitchen/utils/date_time_helpers.dart';

class PlannerCubit extends Cubit<PlannerState> {
  PlannerCubit() : super(PlannerState.initial(DateTime.now().onlyDate)) {
    loadPlanner(DateTime.now());
  }

  /// Load planner info for current selected date [date]
  /// Should be only date, with time at midnight
  Future<void> loadPlanner(DateTime date) async {
    emit(state.copyWith(isLoading: true));
    final day = await HiveDatabase.fetchPlannerDay(date);
    final marked = await HiveDatabase.fetchDays();
    emit(
      state.copyWith(
        day: day,
        selectedDate: date,
        isLoading: false,
      ),
    );
  }

  /// Set [date] as current selected date
  Future<void> selectDay(DateTime date) async {
    emit(state.copyWith(selectedDate: date));
    loadPlanner(date.onlyDate);
    emit(state.copyWith(isLoading: false));
  }

  /// Generate planner with random recipes for [days] number of days, starting from [startDay]
  Future<void> generatePlannerDays(
    BuildContext context,
    DateTime startDay,
    int days,
  ) async {
    emit(state.copyWith(isLoading: true));
    final recipesCubit = BlocProvider.of<RecipesCubit>(context);
    if (recipesCubit.randomRecipesEnabled(Constants.generatedRecipesCount)) {
      final dishes =
          recipesCubit.randomRecipes(Constants.generatedRecipesCount);
      var day = state.day;
      day = day.copyWith(dishes: dishes);
      emit(state.copyWith(day: day));
      updatePlannerDay();
    } else {
      print('Za malo posilków');
    }

    loadPlanner(state.selectedDate);
  }

  Future<void> genereteSelectedDay(BuildContext context) async {
    await generatePlannerDays(context, state.selectedDate, 1);
  }

  /// Get information about days with selected at least one dish
  Future<void> getMarkedDays() async {}

  /// Update planner day
  Future<void> updatePlannerDay() async {
    HiveDatabase.savePlannerDay(state.selectedDate, state.day);
  }

  void addMealToDay(Recipe recipe) {
    final day = state.day;
    emit(state.copyWith(day: day.copyWith(dishes: day.dishes..add(recipe))));
    updatePlannerDay();
  }

  void removeMealFromDay(Recipe recipe) {
    final day = state.day;
    emit(
      state.copyWith(
        day: day.copyWith(
          dishes: day.dishes..removeWhere((element) => element.id == recipe.id),
        ),
      ),
    );
    updatePlannerDay();
  }
}
