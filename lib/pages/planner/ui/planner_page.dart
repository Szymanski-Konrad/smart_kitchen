import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/app/resources/paddings.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/models/planner/planner.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_cubit.dart';
import 'package:smart_kitchen/pages/planner/bloc/planner_cubit.dart';
import 'package:smart_kitchen/pages/planner/bloc/planner_state.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_cubit.dart';
import 'package:smart_kitchen/utils/scoped_bloc_builder.dart';
import 'package:smart_kitchen/utils/ui/planner_card.dart';
import 'package:smart_kitchen/utils/ui/recipe_card.dart';
import 'package:smart_kitchen/utils/ui/section_header.dart';

class PlannerPage extends StatelessWidget {
  const PlannerPage({Key? key}) : super(key: key);

  void _showModalBottomSheet(
    BuildContext context,
    PlannerCubit cubit,
    PlannerState state,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text(Strings.createShopList),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.fastfood_outlined),
              title: const Text(Strings.planNewDish),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBlocBuilder<PlannerCubit, PlannerState>(
      create: (_) => PlannerCubit(),
      builder: (contexet, state, cubit) {
        return Scaffold(
          body: Column(
            children: [
              _buildCalendar(context, cubit, state),
              Expanded(child: _buildDay(context, cubit, state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCalendar(
    BuildContext context,
    PlannerCubit cubit,
    PlannerState state,
  ) {
    final padding = MediaQuery.of(context).padding;
    final topPadding = padding.top > 30 ? padding.top - 30 : 0.0;
    return Container(
      padding: EdgeInsets.only(top: topPadding),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.transparent,
          ],
        ),
      ),
      child: CalendarAgenda(
        backgroundColor: Colors.blue,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now().add(const Duration(days: 30)),
        onDateSelected: print,
        selectedDayPosition: SelectedDayPosition.center,
        locale: 'pl-Pl',
        appbar: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_outlined,
            color: Colors.white,
          ),
          onPressed: () => _showModalBottomSheet(context, cubit, state),
        ),
      ),
    );
  }

  Widget _buildDay(
    BuildContext context,
    PlannerCubit cubit,
    PlannerState state,
  ) {
    final recipesCubit = BlocProvider.of<RecipesCubit>(context);
    return Column(
      children: [
        SingleChildScrollView(
          padding: Paddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.day.isEmpty)
                ElevatedButton(
                  onPressed: () => cubit.genereteSelectedDay(context),
                  child: Text('Wylosuj posiłki'),
                ),
              ...state.day.dishes
                  .map(
                    (dish) =>
                        SingleDish(recipe: dish, category: dish.category.name),
                  )
                  .toList(),
              // SingleDish(
              //   recipe: recipesCubit.state.recipes.first,
              //   category: 'Śniadanie',
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class SingleDish extends StatelessWidget {
  const SingleDish({required this.recipe, required this.category});

  final String category;
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          SectionHeader(title: category),
          PlannerCard(recipe: recipe),
        ],
      ),
    );
  }
}
