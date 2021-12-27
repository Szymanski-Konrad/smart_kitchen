import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/pages/recipe_details/bloc/recipe_details_cubit.dart';
import 'package:smart_kitchen/pages/recipe_details/bloc/recipe_details_state.dart';
import 'package:smart_kitchen/utils/route_argument.dart';
import 'package:smart_kitchen/utils/scoped_bloc_builder.dart';
import 'package:smart_kitchen/utils/ui/section_header.dart';

class RecipeDetailsPage extends StatelessWidget with RouteArgument<Recipe> {
  const RecipeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument = getArgument(context);
    return ScopedBlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
      create: (_) => RecipeDetailsCubit(
        recipe: argument,
        uId: AuthRepository().getUserId(),
      ),
      builder: _buildContent,
    );
  }

  Widget _recipeSection(
    BuildContext context,
    RecipeDetailsState state,
    RecipeDetailsCubit cubit,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Card(
          shadowColor: Colors.white70,
          color: Colors.white70,
          child: _recipeInfo(context, state, cubit),
        ),
      ),
    );
  }

  Widget _mainInfo(
    BuildContext context,
    RecipeDetailsState state,
    RecipeDetailsCubit cubit,
  ) {
    return Card(
      color: Colors.white70,
      shadowColor: Colors.white70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SectionHeader(
            title: Strings.ingredients,
            iconData: Icons.kitchen_outlined,
            trailing: _changeScaleDialog(context, state, cubit),
          ),
          _ingredientsList(context, state, cubit),
          const SizedBox(height: 16),
          const SectionHeader(
            title: Strings.cookSteps,
            iconData: Icons.blender_outlined,
          ),
          _cookStepsList(context, state, cubit),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    RecipeDetailsState state,
    RecipeDetailsCubit cubit,
  ) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: state.hasImage
                ? FileImage(File(state.recipe.imagePath!))
                : const AssetImage('assets/recipe/test3.jpg') as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          Navigation.instance.pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.67,
                        ),
                        _recipeSection(context, state, cubit),
                        _mainInfo(context, state, cubit),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _rateDialog(
    BuildContext context,
    RecipeDetailsState state,
    RecipeDetailsCubit cubit,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Center(
              child: Column(
                children: [
                  RatingBar(
                    initialRating: state.stars,
                    maxRating: 5,
                    minRating: 1,
                    allowHalfRating: true,
                    onRatingUpdate: cubit.changeRate,
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star),
                      empty: const Icon(Icons.star_border),
                      half: const Icon(Icons.star_half),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(Strings.cancel),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cubit.rateRecipe(context);
                          Navigator.of(context).pop();
                        },
                        child: const Text(Strings.send),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _changeScaleDialog(
    BuildContext context,
    RecipeDetailsState state,
    RecipeDetailsCubit cubit,
  ) {
    return _detailsCard(
      content: state.scale.toStringAsFixed(1),
      iconData: Icons.local_dining,
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (context) {
            var scale = state.scale;
            return StatefulBuilder(
              builder: (context, setState) {
                return SimpleDialog(
                  children: [
                    const Center(child: Text(Strings.recipeProportions)),
                    DecimalNumberPicker(
                      value: scale,
                      minValue: 1,
                      maxValue: 10,
                      onChanged: (value) {
                        setState(() {
                          scale = value;
                        });
                      },
                    ),
                    MaterialButton(
                      child: const Text(Strings.change),
                      onPressed: () {
                        Navigator.of(context).pop();
                        cubit.changeScale(scale);
                      },
                    )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _recipeInfo(
    BuildContext context,
    RecipeDetailsState state,
    RecipeDetailsCubit cubit,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.recipe.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              _detailsCard(
                content: state.recipeRating,
                iconData: Icons.star_border_outlined,
              ),
            ],
          ),
          if (state.hasKcal)
            _detailsCard(
              content:
                  ' ${state.kcal?.toStringAsFixed(0) ?? 0} ${Strings.calories}',
              iconData: Icons.bolt_rounded,
            ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (state.recipe.isCookingAvailable)
                ElevatedButton.icon(
                  onPressed: cubit.goToCookingPage,
                  icon: const Icon(Icons.dinner_dining_outlined),
                  label: const Text(Strings.letsCook),
                ),
              if (state.recipe.userId != cubit.uId)
                ElevatedButton.icon(
                  onPressed: () => _rateDialog(context, state, cubit),
                  icon: const Icon(Icons.star_rate_rounded),
                  label: const Text(Strings.rating),
                ),
              if (state.recipe.userId == cubit.uId)
                ElevatedButton.icon(
                  onPressed: cubit.goToEditRecipe,
                  icon: const Icon(Icons.edit),
                  label: const Text(Strings.edit),
                )
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailsCard({
    required String content,
    required IconData iconData,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(iconData),
            const SizedBox(width: 8),
            Text(content),
          ],
        ),
      ),
    );
  }

  Widget _recipeImage(
    BuildContext context,
    RecipeDetailsState state,
    RecipeDetailsCubit cubit,
  ) {
    return Hero(
      tag: state.recipe.id,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(80),
            bottomLeft: Radius.circular(80),
          ),
          image: DecorationImage(
            image: state.hasImage
                ? FileImage(File(state.recipe.imagePath!))
                : const AssetImage('assets/noimage.jpg') as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _cookStepsList(
    BuildContext context,
    RecipeDetailsState state,
    RecipeDetailsCubit cubit,
  ) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.recipe.steps.length,
      itemBuilder: (context, index) {
        final step = state.recipe.steps[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 12,
            child: Text('${index + 1}'),
          ),
          title: Text(step.content),
        );
      },
    );
  }

  Widget _ingredientsList(
    BuildContext context,
    RecipeDetailsState state,
    RecipeDetailsCubit cubit,
  ) {
    return ListView.builder(
      primary: false,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.recipe.ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = state.recipe.ingredients[index];
        return ListTile(
          dense: true,
          onTap: () {},
          leading: const Icon(Icons.add),
          title: Text(ingredient.showScaled(state.scale)),
        );
      },
    );
  }
}
