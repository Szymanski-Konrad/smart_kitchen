import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/app/resources/paddings.dart';
import 'package:smart_kitchen/app/resources/spacings.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
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

  Widget _buildInfoTab(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return ListView(
      padding: Paddings.horizontal16,
      children: [
        AspectRatio(
          aspectRatio: 5 / 3,
          child: GestureDetector(
            onTap: () => _imageBottomSheet(context, cubit, state),
            child: Container(
              margin: Paddings.vertical16,
              decoration: BoxDecoration(
                border: Border.all(color: ColorPalette.black),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: state.isImageSelected
                    ? DecorationImage(
                        image: FileImage(File(state.imagePath)),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: state.isImageSelected
                  ? null
                  : const Center(child: Text(Strings.addPhoto)),
            ),
          ),
        ),
        StandardTextField(
          initialValue: state.name,
          hintText: Strings.recipeNameHint,
          onChanged: (value) => cubit.updateName(value),
        ),
        Spacings.s8,
        SizedBox(
          height: 70,
          width: 300,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(child: SectionHeader(title: Strings.category)),
              _categoryDropdown(context, cubit, state),
            ],
          ),
        ),
        Spacings.s8,
        const SectionHeader(
          title: Strings.notes,
          iconData: Icons.notes,
        ),
        StandardTextField(
          initialValue: state.notes,
          hintText: Strings.notesHint,
          minLines: 5,
          maxLines: 5,
          onChanged: (value) => cubit.updateNotes(value),
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }

  Widget _buildIngredientsAndStepsTab(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return ListView(
      padding: Paddings.horizontal16,
      children: [
        // SectionHeader(
        //   title: Strings.sections,
        //   iconData: Icons.layers,
        //   trailing: TextButton.icon(
        //     onPressed: () {},
        //     icon: const Icon(Icons.edit),
        //     label: const Text(Strings.edit),
        //   ),
        // ),
        // _sectionsList(context, cubit, state),
        SectionHeader(
          title: Strings.ingredients,
          iconData: Icons.kitchen,
          trailing: TextButton.icon(
            onPressed: cubit.ingredientsInput,
            label: const Text(Strings.edit),
            icon: const Icon(Icons.edit),
          ),
        ),
        _ingredientsList(context, cubit, state),
        SmallSectionHeader(title: 'Default'),
        SectionHeader(
          title: Strings.cookSteps,
          iconData: Icons.blender,
          trailing: TextButton.icon(
            onPressed: cubit.stepsInput,
            label: const Text(Strings.edit),
            icon: const Icon(Icons.edit),
          ),
        ),
        _cookStepsList(context, cubit, state),
      ],
    );
  }

  Widget _buildContent(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
            child: TabBar(
              tabs: [
                Text(Strings.info, style: TextStyles.chipItem),
                Text(Strings.ingredientsAndSteps, style: TextStyles.chipItem),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildInfoTab(context, cubit, state),
                _buildIngredientsAndStepsTab(context, cubit, state),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIngredientsWithHeader(
    BuildContext context,
    String title,
    List<Ingredient> ingredients,
  ) {
    return Column(
      children: [
        SmallSectionHeader(title: title),
        ...ingredients.map((e) => IngredientTile(ingredient: e)).toList(),
      ],
    );
  }

  Widget _sectionsList(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return Column(
      children: [
        ...state.sections
            .map((e) => SmallSectionHeader(title: e.name))
            .toList(),
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
              return IngredientTile(ingredient: state.ingredients[index]);
            },
          )
        : const Padding(
            padding: Paddings.all8,
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
              );
            },
          )
        : const Padding(
            padding: EdgeInsets.all(8),
            child: Text(Strings.emptyRecipeStepsList),
          );
  }

  Widget _categoryDropdown(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButton<Category>(
        dropdownColor: Colors.white,
        items: Category.values
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e.name),
              ),
            )
            .toList(),
        onChanged: (value) {
          if (value != null) {
            cubit.updateCategory(value);
          }
        },
        value: state.category,
        hint: const Text(Strings.selectCategory),
        // isExpanded: true,
      ),
    );
  }

  void _imageBottomSheet(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              Strings.photoOptions,
              style: TextStyles.sectionHeader,
            ),
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
            if (state.isImageSelected)
              ListTile(
                leading: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                title: const Text(Strings.removePhoto),
                onTap: () async {
                  cubit.updateImagePath('');
                  Navigation.instance.pop();
                },
              ),
          ],
        );
      },
    );
  }
}
