import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:smart_kitchen/app/app.dart';
import 'package:smart_kitchen/app/app_bloc_observer.dart';
import 'package:smart_kitchen/app/logging/logger.dart';
import 'package:smart_kitchen/features/hive/hive_database.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/planner/planner.dart';
import 'package:smart_kitchen/models/recipe/category.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/models/step/recipe_step.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await Hive.initFlutter();

  Hive
    ..registerAdapter(RecipeAdapter())
    ..registerAdapter(IngredientAdapter())
    ..registerAdapter(PlannerDayAdapter())
    ..registerAdapter(RecipeStepAdapter())
    ..registerAdapter(CategoryAdapter());

  // await HiveDatabase.clearDatabase();
  await HiveDatabase.init();
  await HiveDatabase.fillDatabase();

  FirebaseAuth.instance.authStateChanges().skip(1).listen((user) async {
    if (user != null) {
      Log.d(user);
    }
  });

  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );

  // runZonedGuarded(
  //   () => runApp(const App()),
  //   (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  // );
}
