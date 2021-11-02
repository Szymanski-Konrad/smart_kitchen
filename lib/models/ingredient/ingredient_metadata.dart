class IngredientMetadata {
  IngredientMetadata({
    required this.name,
    this.unit,
    this.amount,
  });

  String name;
  String? unit;
  double? amount;
}
