import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/navigation/routes.dart';
import 'package:smart_kitchen/pages/auth/ui/sign_in_page.dart';
import 'package:smart_kitchen/pages/auth/ui/sign_up_page.dart';
import 'package:smart_kitchen/pages/auth/ui/splash_page.dart';
import 'package:smart_kitchen/pages/cooking/ui/cooking_page.dart';
import 'package:smart_kitchen/pages/home/ui/home_page.dart';
import 'package:smart_kitchen/pages/new_recipe/ui/ingredients_input_page.dart';
import 'package:smart_kitchen/pages/new_recipe/ui/new_recipe_page.dart';
import 'package:smart_kitchen/pages/new_recipe/ui/steps_input_page.dart';
import 'package:smart_kitchen/pages/planner/ui/planner_page.dart';
import 'package:smart_kitchen/pages/recipe_details/ui/recipe_details_page.dart';

abstract class AppRouter {
  const AppRouter._();

  static Route<Object>? generate(RouteSettings settings) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (_) => settings.page,
            settings: settings,
          )
        : MaterialPageRoute(
            builder: (_) => settings.page,
            settings: settings,
          );
  }
}

extension on RouteSettings {
  Widget get page {
    switch (name) {
      case SharedRoutes.home:
        return const HomePage();
      case SharedRoutes.signIn:
        return const SignInPage();
      case SharedRoutes.signUp:
        return const SignUpPage();
      case SharedRoutes.intro:
        return const SplashScreen();
      case SharedRoutes.check:
        return FirebaseAuth.instance.currentUser != null
            ? const HomePage()
            : const SplashScreen();
      case SharedRoutes.recipeDetails:
        return const RecipeDetailsPage();
      case SharedRoutes.newRecipe:
        return NewRecipePage();
      case SharedRoutes.newIngredient:
        return const IngredientsInput();
      case SharedRoutes.newStep:
        return const StepsInput();
      case SharedRoutes.cooking:
        return const CookingPage();
      case SharedRoutes.planner:
        return const PlannerPage();
      default:
        return const SplashScreen();
    }
  }
}
