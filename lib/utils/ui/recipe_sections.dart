import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/constants.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';

class RecipeName extends StatelessWidget {
  const RecipeName({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyles.recipeName,
    );
  }
}

class RecipeRating extends StatelessWidget {
  const RecipeRating({Key? key, required this.rating}) : super(key: key);

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star),
        Text(
          rating,
          style: TextStyles.recipeRating,
        ),
      ],
    );
  }
}

class RecipeImagePreview extends StatelessWidget {
  const RecipeImagePreview({
    Key? key,
    required this.recipe,
    this.smallPreview = false,
  }) : super(key: key);

  final Recipe recipe;
  final bool smallPreview;

  @override
  Widget build(BuildContext context) {
    final imagePath = recipe.imagePath;
    return AspectRatio(
      aspectRatio: Constants.imagePreviewAspectRatio,
      //TODO: Consider changing to ClipRRect
      child: Container(
        height: smallPreview
            ? Constants.smallImagePreviewHeight
            : Constants.imagePreviewHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: recipe.imageIncluded && imagePath != null
                ? FileImage(File(imagePath))
                : const AssetImage('assets/noimage.jpg') as ImageProvider,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
