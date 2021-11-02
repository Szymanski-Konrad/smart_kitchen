import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_kitchen/models/recipe/category.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';

part 'recipes_state.freezed.dart';

@freezed
class RecipesState with _$RecipesState {
  factory RecipesState({
    required List<Recipe> recipes,
    String? searchString,
    @Default(Category.breakfast) Category selectedCategory,
    String? currentUserId,
  }) = _RecipesState;

  static RecipesState initial(String? userId) => RecipesState(
        currentUserId: userId,
        recipes: [],
      );
}

extension RecipesStateExtensions on RecipesState {
  bool get isSearching => searchString != null && searchString!.isNotEmpty;
  List<Recipe> get categoryRecipes =>
      recipes.where((element) => element.category == selectedCategory).toList();
  int get categoryCount => categoryRecipes.length;

  List<Recipe> get filteredRecipes {
    final search = searchString;
    if (search == null) {
      return [];
    } else {
      return recipes.where((element) => element.name.contains(search)).toList();
    }
  }
}
