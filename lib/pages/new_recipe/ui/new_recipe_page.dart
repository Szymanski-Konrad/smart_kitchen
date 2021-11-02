import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/models/recipe/category.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_cubit.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_state.dart';
import 'package:smart_kitchen/utils/route_argument.dart';
import 'package:smart_kitchen/utils/ui/loading_view.dart';
import 'package:smart_kitchen/utils/ui/new_recipe_ui.dart';
import 'package:smart_kitchen/utils/ui/section_header.dart';
import 'package:smart_kitchen/utils/ui/standard_text_field.dart';

class NewRecipePage extends StatelessWidget with RouteArgument<Recipe?> {
  NewRecipePage({Key? key}) : super(key: key);

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final recipe = tryGetArguments(context);
    final cubit = BlocProvider.of<NewRecipeCubit>(context);
    if (recipe != null) cubit.editRecipe(recipe);
    return BlocConsumer<NewRecipeCubit, NewRecipeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(Strings.newRecipe),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed:
                    state.isValid ? () => cubit.saveRecipe(context) : null,
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          body: state.isSaving
              ? const LoadingView()
              : _buildContent(context, cubit, state),
        );
      },
    );
  }

  Widget _buildContent(
      BuildContext context, NewRecipeCubit cubit, NewRecipeState state) {
    return ListView(
      children: [
        const SectionHeader(title: Strings.image, iconData: Icons.photo),
        if (state.isImageSelected)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.file(
              File(state.imagePath),
              height: 200,
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton.icon(
              onPressed: () => _imageBottomSheet(context, cubit),
              icon: const Icon(Icons.photo),
              label: Text(
                state.isImageSelected ? Strings.replacePhoto : Strings.addPhoto,
              ),
            ),
            if (state.isImageSelected)
              OutlinedButton.icon(
                onPressed: () => cubit.updateImagePath(''),
                icon: const Icon(Icons.delete_forever),
                label: const Text(Strings.removePhoto),
              ),
          ],
        ),
        const SectionHeader(title: Strings.recipeName, iconData: Icons.edit),
        StandardTextField(
          initialValue: state.name,
          hintText: Strings.recipeNameHint,
          onChanged: (value) => cubit.updateName(value),
        ),
        const SectionHeader(
          title: Strings.category,
          iconData: Icons.category_outlined,
        ),
        _categoryDropdown(context, cubit, state),
        SectionHeader(
          title: Strings.ingredients,
          iconData: Icons.kitchen,
          trailing: TextButton.icon(
            onPressed: cubit.ingredientsInput,
            label: const Text(Strings.ingredient),
            icon: const Icon(Icons.add),
          ),
        ),
        _ingredientsList(context, cubit, state),
        SectionHeader(
          title: Strings.cookSteps,
          iconData: Icons.blender,
          trailing: TextButton.icon(
            onPressed: cubit.stepsInput,
            label: const Text(Strings.cookStep),
            icon: const Icon(Icons.add),
          ),
        ),
        _cookStepsList(context, cubit, state),
        const SectionHeader(
          title: Strings.notes,
          iconData: Icons.notes,
        ),
        StandardTextField(
          initialValue: state.notes,
          hintText: Strings.notesHint,
          onChanged: (value) => cubit.updateNotes(value),
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }

  Widget _ingredientsList(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return state.ingredients.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.ingredients.length,
            itemBuilder: (context, index) {
              return IngredientTile(
                ingredient: state.ingredients[index],
                cubit: cubit,
              );
            },
          )
        : const Padding(
            padding: EdgeInsets.all(8),
            child: Text(Strings.emptyIngredientsList),
          );
  }

  Widget _cookStepsList(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return state.steps.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.steps.length,
            itemBuilder: (context, index) {
              return RecipeStepTile(
                index: index,
                step: state.steps[index],
                cubit: cubit,
              );
            },
          )
        : const Padding(
            padding: EdgeInsets.all(8),
            child: Text(Strings.emptyRecipeStepsList),
          );
  }

  Widget _categoryDropdown(
      BuildContext context, NewRecipeCubit cubit, NewRecipeState state) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButton<Category>(
        items: Category.values
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            cubit.updateCategory(value);
          }
        },
        value: state.category,
        hint: const Text(Strings.selectCategory),
        isExpanded: true,
      ),
    );
  }

  void _imageBottomSheet(BuildContext context, NewRecipeCubit cubit) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(Strings.selectPhoto),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text(Strings.fromAparat),
              onTap: () async {
                await cubit.selectImage(ImageSource.camera);
                Navigation.instance.pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text(Strings.fromLibrary),
              onTap: () async {
                await cubit.selectImage(ImageSource.gallery);
                Navigation.instance.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
