import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/recipe/category.dart';
import 'package:smart_kitchen/models/step/recipe_step.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  @HiveType(typeId: 0, adapterName: 'RecipeAdapter')
  factory Recipe({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required Category category,
    @HiveField(3) String? imagePath,
    @HiveField(4) String? notes,
    @HiveField(5) required String userId,
    @HiveField(6) @Default(0.0) double rating,
    @HiveField(7) @Default(<String, double>{}) Map<String, double> votes,
    @HiveField(8) required List<Ingredient> ingredients,
    @HiveField(9) required List<RecipeStep> steps,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

extension RecipeExtensions on Recipe {
  bool get imageIncluded => imagePath != null && imagePath!.isNotEmpty;

  bool get isCookingAvailable {
    final usedIds = steps.map((step) => step.ingredients).flattened.toList();
    final ingredientsIds = ingredients.map((ingredient) => ingredient.id);
    return ingredientsIds.every(usedIds.contains);
  }

  bool hasUserRate(String uid) => votes.containsKey(uid);

  double updateRating(String uid, double stars) {
    final userRating = votes[uid] ?? 0;
    final amount = rating * votes.length + stars - userRating;
    return userRating == 0
        ? amount / (votes.length + 1)
        : amount / votes.length;
  }

  Map<String, double> updateVotes(String uid, double stars) {
    final map = Map<String, double>.from(votes)..addAll({uid: stars});
    return map;
  }

  String get formattedRating => rating.toStringAsFixed(2);
}
