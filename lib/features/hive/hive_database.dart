import 'package:hive/hive.dart';
import 'package:smart_kitchen/app/resources/initial_recipes.dart';
import 'package:smart_kitchen/models/planner/planner.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';

class HiveDatabase {
  static String recipesBox = 'recipes-box';
  static String ingredientsBox = 'ingredients-box';
  static String stepsBox = 'steps-box';
  static String plannerBox = 'planner-box';

  static Future<void> init() async {
    await Hive.openBox<Recipe>(recipesBox);
    await Hive.openBox<PlannerDay>(plannerBox);
  }

  static Future<void> clearDatabase() async {
    await Hive.deleteBoxFromDisk(recipesBox);
    await Hive.deleteBoxFromDisk(plannerBox);
  }

  static Future<void> fillDatabase() async {
    final box = Hive.box<Recipe>(recipesBox);

    if (box.isEmpty) {
      await saveRecipe(InitialRecipes.plackiTwarogowe());
      await saveRecipe(InitialRecipes.bananaCoctail());
    }
  }

  /// Fetching recipes saved on device
  static Future<List<Recipe>> fetchLocalRecipes() async {
    final box = Hive.box<Recipe>(recipesBox);
    return box.values.toList();
  }

  static Future<void> saveRecipe(Recipe recipe) async {
    final box = Hive.box<Recipe>(recipesBox);
    await box.put(recipe.id, recipe);
  }

  static Future<void> removeRecipe(Recipe recipe) async {
    final box = Hive.box<Recipe>(recipesBox);
    await box.delete(recipe.id);
  }
}
