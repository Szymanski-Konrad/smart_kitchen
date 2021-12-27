import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_cubit.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_cubit.dart';

abstract class GlobalBlocs {
  const GlobalBlocs._();

  static final List<BlocProvider> providers = [
    BlocProvider<NewRecipeCubit>(
      create: (_) => NewRecipeCubit(),
      lazy: true,
    ),
    BlocProvider<RecipesCubit>(
      create: (_) =>
          RecipesCubit(authRepository: AuthRepository())..fetchRecipes(),
      lazy: true,
    ),
  ];
}
