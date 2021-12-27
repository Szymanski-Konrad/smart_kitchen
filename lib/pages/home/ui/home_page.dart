import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';
import 'package:smart_kitchen/pages/home/bloc/home_cubit.dart';
import 'package:smart_kitchen/pages/home/bloc/home_state.dart';
import 'package:smart_kitchen/pages/planner/ui/planner_page.dart';
import 'package:smart_kitchen/pages/recipes/ui/recipes_page.dart';
import 'package:smart_kitchen/utils/scoped_bloc_builder.dart';

enum BottomNavigation {
  shoplist,
  recipes,
  products,
  planner,
  profile,
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBlocBuilder<HomeCubit, HomeState>(
      create: (_) => HomeCubit(
        authRepository: AuthRepository(),
      ),
      builder: (context, state, cubit) {
        return Scaffold(
          body: currentPage(state.currentIndex),
          bottomNavigationBar: Container(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            child: BottomNavigationBar(
              currentIndex: state.currentIndex,
              items: bottomIcons,
              onTap: (index) => cubit.changePage(index),
            ),
          ),
        );
      },
    );
  }

  Widget currentPage(int index) {
    if (index == BottomNavigation.shoplist.index) return const RecipesPage();
    if (index == BottomNavigation.recipes.index) return const RecipesPage();
    if (index == BottomNavigation.products.index) return const RecipesPage();
    if (index == BottomNavigation.planner.index) return const PlannerPage();
    if (index == BottomNavigation.profile.index) return const RecipesPage();
    return const RecipesPage();
  }

  static const List<BottomNavigationBarItem> bottomIcons = [
    BottomNavigationBarItem(
      label: Strings.basket,
      backgroundColor: ColorPalette.lightBlue,
      icon: Icon(Icons.shopping_basket),
    ),
    BottomNavigationBarItem(
      label: Strings.recipes,
      backgroundColor: ColorPalette.lightBlue,
      icon: Icon(Icons.receipt),
    ),
    BottomNavigationBarItem(
      label: Strings.products,
      backgroundColor: ColorPalette.lightBlue,
      icon: Icon(Icons.fastfood),
    ),
    BottomNavigationBarItem(
      label: Strings.planner,
      backgroundColor: ColorPalette.lightBlue,
      icon: Icon(Icons.calendar_today),
    ),
    BottomNavigationBarItem(
      label: Strings.profile,
      backgroundColor: ColorPalette.lightBlue,
      icon: Icon(Icons.account_circle),
    ),
  ];
}
