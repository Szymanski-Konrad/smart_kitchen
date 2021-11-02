import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/pages/home/bloc/home_cubit.dart';
import 'package:smart_kitchen/pages/home/bloc/home_state.dart';
import 'package:smart_kitchen/pages/recipes/ui/recipes_page.dart';
import 'package:smart_kitchen/utils/scoped_bloc_builder.dart';

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
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              items: bottomIcons,
              onTap: (index) => cubit.changePage(index),
            ));
      },
    );
  }

  Widget currentPage(int index) {
    if (index == 0) return const RecipesPage();
    if (index == 1) return const RecipesPage();
    if (index == 2) return const RecipesPage();
    if (index == 3) return const RecipesPage();
    if (index == 4) return const RecipesPage();
    return const RecipesPage();
  }

  static const List<BottomNavigationBarItem> bottomIcons = [
    BottomNavigationBarItem(
      label: Strings.basket,
      icon: Icon(
        Icons.shopping_basket,
        size: 16,
      ),
    ),
    BottomNavigationBarItem(
      label: Strings.recipes,
      icon: Icon(
        Icons.receipt,
        size: 16,
      ),
    ),
    BottomNavigationBarItem(
      label: Strings.products,
      icon: Icon(
        Icons.fastfood,
        size: 16,
      ),
    ),
    BottomNavigationBarItem(
      label: Strings.planner,
      icon: Icon(
        Icons.calendar_today,
        size: 16,
      ),
    ),
    BottomNavigationBarItem(
      label: Strings.profile,
      icon: Icon(
        Icons.account_circle,
        size: 16,
      ),
    ),
  ];
}
