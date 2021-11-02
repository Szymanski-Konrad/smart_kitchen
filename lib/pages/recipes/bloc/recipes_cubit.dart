import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/global_blocs/global_cubit.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/navigation/routes.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/features/hive/hive_database.dart';
import 'package:smart_kitchen/models/recipe/category.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_state.dart';

class RecipesCubit extends GlobalCubit<RecipesState> {
  RecipesCubit({required this.authRepository})
      : super(RecipesState.initial(authRepository.getUserId()));

  final AuthRepository authRepository;

  void changeCategory(Category category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void changeSearchString(String? searchString) {
    emit(state.copyWith(searchString: searchString));
  }

  void setUserId(String? userId) {
    emit(state.copyWith(currentUserId: userId));
  }

  Future<void> fetchRecipes() async {
    final recipes = await HiveDatabase.fetchLocalRecipes();
    emit(state.copyWith(recipes: recipes));
  }

  void updateRecipe(Recipe recipe) {
    final recipes = List<Recipe>.from(state.recipes);
    final index = recipes.indexWhere((element) => element.id == recipe.id);
    if (index == -1) return;
    recipes[index] = recipe;
    emit(state.copyWith(recipes: recipes));
  }

  Future<void> createNewRecipe() async {
    await Navigation.instance.push(SharedRoutes.newRecipe);
    await fetchRecipes();
  }
}
