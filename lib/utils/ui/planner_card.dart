import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/navigation/routes.dart';
import 'package:smart_kitchen/app/resources/constants.dart';
import 'package:smart_kitchen/app/resources/spacings.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/utils/ui/recipe_sections.dart';

class PlannerCard extends StatelessWidget {
  const PlannerCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.instance.push(SharedRoutes.recipeDetails, arguments: recipe);
      },
      child: SizedBox(
        height: Constants.smallImagePreviewHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RecipeImagePreview(
              recipe: recipe,
              smallPreview: true,
            ),
            Spacings.s16,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeName(name: recipe.name),
                  Spacings.s8,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
