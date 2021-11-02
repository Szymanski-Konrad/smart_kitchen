import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_kitchen/app/global_blocs/global_cubit.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/navigation/routes.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/features/hive/hive_database.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/recipe/category.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/models/step/recipe_step.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_state.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_cubit.dart';
import 'package:smart_kitchen/utils/string_extractor.dart';
import 'package:uuid/uuid.dart';

class NewRecipeCubit extends GlobalCubit<NewRecipeState> {
  NewRecipeCubit()
      : super(NewRecipeState.initial(AuthRepository().getUserId()!));

  final _picker = ImagePicker();

  void editRecipe(Recipe recipe) {
    emit(NewRecipeState.fromRecipe(recipe));
  }

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateCategory(Category category) {
    emit(state.copyWith(category: category));
  }

  void updateImagePath(String imagePath) {
    emit(state.copyWith(imagePath: imagePath));
  }

  void updateNotes(String notes) {
    emit(state.copyWith(notes: notes));
  }

  Future<void> selectImage(ImageSource source) async {
    final image = await _picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    if (image != null) {
      updateImagePath(image.path);
    }
  }

  // Ingredients

  void parseIngredientInput(String input) {
    final metadata = StringExtractor.resolveProduct(input);
    final ingredient = Ingredient.resolved(metadata, state.id);
    addIngredient(ingredient);
  }

  void updateIngredientFromInput(String input, Ingredient ingredient) {
    final metadata = StringExtractor.resolveProduct(input);
    updateIngredient(
      ingredient.copyWith(
        amount: metadata.amount,
        name: metadata.name,
        unit: metadata.unit,
      ),
    );
  }

  void addIngredient(Ingredient ingredient) {
    final ingredients = List<Ingredient>.from(state.ingredients)
      ..add(ingredient);
    emit(state.copyWith(ingredients: ingredients));
  }

  void removeIngredient(Ingredient ingredient) {
    final ingredients = List<Ingredient>.from(state.ingredients)
      ..removeWhere((element) => element.id == ingredient.id);
    emit(state.copyWith(ingredients: ingredients));
    final steps = state.steps
        .where((element) => element.ingredients.contains(ingredient.id))
        .toList();
    if (steps.isNotEmpty) {
      removeIngredientFromStep(steps.first, ingredient);
    }
  }

  void updateIngredient(Ingredient ingredient) {
    final ingredients = List<Ingredient>.from(state.ingredients);
    final index =
        ingredients.indexWhere((element) => element.id == ingredient.id);
    ingredients.setAll(index, [ingredient]);
    emit(state.copyWith(ingredients: ingredients));
  }

  // Steps

  void addStepFromInput(String input) {
    final step = RecipeStep.withId(recipeId: state.id, content: input);
    addStep(step);
  }

  void updateStepFromInput(String input, RecipeStep step) {
    updateStep(step.copyWith(content: input));
  }

  void addStep(RecipeStep step) {
    final steps = List<RecipeStep>.from(state.steps)..add(step);
    emit(state.copyWith(steps: steps));
  }

  void removeStep(RecipeStep step) {
    final steps = List<RecipeStep>.from(state.steps)
      ..removeWhere((element) => element.id == step.id);
    emit(state.copyWith(steps: steps));
  }

  void updateStep(RecipeStep step) {
    final steps = List<RecipeStep>.from(state.steps);
    final index = steps.indexWhere((element) => element.id == step.id);
    steps.setAll(index, [step]);
    emit(state.copyWith(steps: steps));
  }

  void processStepIngredient(
    RecipeStep step,
    Ingredient ingredient,
    bool shouldAdd,
  ) {
    if (shouldAdd) {
      addIngredientToStep(step, ingredient);
    } else {
      removeIngredientFromStep(step, ingredient);
    }
  }

  void addIngredientToStep(RecipeStep currentStep, Ingredient ingredient) {
    final steps = List<RecipeStep>.from(state.steps);
    final index = steps.indexWhere((element) => element.id == currentStep.id);
    var step = state.steps[index];
    final ingredients = List<String>.from(step.ingredients);
    step = step.copyWith(ingredients: ingredients..add(ingredient.id));
    steps.setAll(index, [step]);
    emit(state.copyWith(steps: steps));
  }

  void removeIngredientFromStep(RecipeStep currentStep, Ingredient ingredient) {
    final steps = List<RecipeStep>.from(state.steps);
    final index = steps.indexWhere((element) => element.id == currentStep.id);
    var step = state.steps[index];
    final ingredients = List<String>.from(step.ingredients);
    step = step.copyWith(ingredients: ingredients..remove(ingredient.id));
    steps.setAll(index, [step]);
    emit(state.copyWith(steps: steps));
  }

  void setStepTimer(RecipeStep currenStep, int timer) {
    // step = step.copyWith(timers: timers..addAll({const Uuid().v1(): timer}));
    final steps = List<RecipeStep>.from(state.steps);
    final index = steps.indexWhere((element) => element.id == currenStep.id);
    var step = state.steps[index];
    step = step.copyWith(timers: {const Uuid().v1(): timer});
    steps.setAll(index, [step]);
    emit(state.copyWith(steps: steps));
  }

  // Recipe

  Future<void> saveRecipe(BuildContext context) async {
    emit(state.copyWith(isSaving: true));
    final recipe = Recipe(
      id: state.id,
      category: state.category,
      ingredients: state.ingredients,
      name: state.name,
      steps: state.steps,
      userId: state.uid,
      imagePath: state.imagePath,
      notes: state.notes,
      rating: 0,
      votes: {},
    );

    await HiveDatabase.saveRecipe(recipe);
    emit(state.copyWith(isSaving: false));
    BlocProvider.of<RecipesCubit>(context).fetchRecipes();
    Navigation.instance.pop();
  }

  Future<void> ingredientsInput() async {
    await Navigation.instance.push(SharedRoutes.newIngredient);
  }

  Future<void> stepsInput() async {
    await Navigation.instance.push(SharedRoutes.newStep);
  }
}
