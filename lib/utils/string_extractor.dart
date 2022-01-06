import 'package:smart_kitchen/app/resources/parser_values.dart';
import 'package:smart_kitchen/models/ingredient/ingredient_metadata.dart';
import 'package:string_similarity/string_similarity.dart';

class StringExtractor {
  static IngredientMetadata resolveProduct(String input) {
    final splitted = input.trim().split(' ');
    final productMetadata = IngredientMetadata(name: '');
    final amount = double.tryParse(splitted.first);
    productMetadata.amount = amount;
    if (amount != null) {
      splitted[0] = '';
      final matches = splitted[1].bestMatch(ParserValues.units);
      final rating = matches.bestMatch.rating;
      if (rating != null && rating >= 0.7) {
        productMetadata.unit = splitted[1];
        splitted[1] = '';
      }
    }

    productMetadata.name = splitted.join(' ').trim();
    return productMetadata;
  }
}
