import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/navigation/routes.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            Expanded(
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Hero(
                    tag: recipe.id,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: recipe.imageIncluded
                                ? FileImage(File(recipe.imagePath!))
                                : const AssetImage('assets/noimage.jpg')
                                    as ImageProvider,
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    left: 8,
                    right: 8,
                    child: _recipeLabel(recipe.name),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: _recipeRating(recipe.rating),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recipeRating(double rating) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        color: ColorPalette.accent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            const Icon(Icons.star_outline),
            Text(rating.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }

  Widget _recipeLabel(String title) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(title),
      ),
    );
  }
}
