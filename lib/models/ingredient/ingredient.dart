import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_kitchen/models/ingredient/ingredient_metadata.dart';
import 'package:uuid/uuid.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  @HiveType(typeId: 1, adapterName: 'IngredientAdapter')
  factory Ingredient({
    @HiveField(0) required String id,
    @HiveField(1) required String recipeId,
    @HiveField(2) required String name,
    @HiveField(3) String? unit,
    @HiveField(4) double? amount,
  }) = _Ingredient;

  factory Ingredient.withId({
    required String recipeId,
    required String name,
    String? unit,
    double? amount,
  }) {
    return Ingredient(
      id: const Uuid().v1(),
      recipeId: recipeId,
      name: name,
      unit: unit,
      amount: amount,
    );
  }

  factory Ingredient.resolved(IngredientMetadata metadata, String recipeId) {
    return Ingredient.withId(
      recipeId: recipeId,
      name: metadata.name,
      unit: metadata.unit,
      amount: metadata.amount,
    );
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

extension IngredientExtension on Ingredient {
  String amountStringify(double value) =>
      value.toStringAsFixed(value.toInt() == value ? 0 : 1);

  String scaledAmount(double scale) {
    final value = amount;
    return value == null ? '' : amountStringify(value * scale);
  }

  String get unitString => unit ?? '';

  String get show => '${scaledAmount(1)} ${unit ?? ''} $name'.trim();
  String showScaled(double scale) =>
      '${scaledAmount(scale)} ${unit ?? ''} $name'.trim();
}
