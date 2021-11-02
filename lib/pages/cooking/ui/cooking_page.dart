import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/pages/cooking/bloc/cooking_cubit.dart';
import 'package:smart_kitchen/pages/cooking/bloc/cooking_state.dart';
import 'package:smart_kitchen/utils/route_argument.dart';
import 'package:smart_kitchen/utils/scoped_bloc_builder.dart';

class CookingPageArgument {
  CookingPageArgument({
    required this.recipe,
    required this.scale,
  });

  final Recipe recipe;
  final double scale;
}

class CookingPage extends StatelessWidget
    with RouteArgument<CookingPageArgument> {
  const CookingPage({Key? key}) : super(key: key);

  Future<bool> _onWillPop(BuildContext context, CookingCubit cubit) async {
    final result = await showDialog<bool>(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Na pewno?"),
            content:
                Text("Chcesz przerwać gotowanie? Progres zostanie utracony"),
            actions: <Widget>[
              TextButton(
                child: Text("Tak"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              ElevatedButton(
                child: Text("Nie"),
                onPressed: () => Navigator.of(context).pop(false),
              )
            ],
          );
        });

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final argument = getArgument(context);
    return ScopedBlocBuilder<CookingCubit, CookingState>(
      create: (_) => CookingCubit(
        recipe: argument.recipe,
        scale: argument.scale,
      ),
      builder: (context, state, cubit) {
        Widget child = const SizedBox();
        switch (state.status) {
          case CookingStatus.prepare:
            child = Scaffold(
              appBar: _prepareAppBar(context, cubit, state),
              body: _buildPrepare(context, cubit, state),
            );
            break;
          case CookingStatus.steps:
            child = Scaffold(
              appBar: _stepAppBar(context, cubit, state),
              body: _buildStep(context, cubit, state),
            );
            break;
          case CookingStatus.summary:
            child = Scaffold(
              appBar: _summaryAppBar(context, cubit, state),
              body: _buildSummary(context, cubit, state),
            );
            break;
        }

        return WillPopScope(
          child: child,
          onWillPop: () => _onWillPop(context, cubit),
        );
      },
    );
  }

  AppBar _prepareAppBar(
    BuildContext context,
    CookingCubit cubit,
    CookingState state,
  ) {
    return AppBar(
      title: const Text(Strings.prepareIngredients),
      primary: false,
      toolbarHeight: MediaQuery.of(context).size.height * 0.2,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/cookpanel.jpg'),
          fit: BoxFit.cover,
        )),
      ),
    );
  }

  AppBar _stepAppBar(
    BuildContext context,
    CookingCubit cubit,
    CookingState state,
  ) {
    return AppBar(
      title: Text(state.stepState),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/cookpanel.jpg'),
          fit: BoxFit.cover,
        )),
      ),
    );
  }

  AppBar _summaryAppBar(
    BuildContext context,
    CookingCubit cubit,
    CookingState state,
  ) {
    return AppBar(
      title: const Text(Strings.summary),
      primary: false,
      toolbarHeight: MediaQuery.of(context).size.height * 0.2,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/cookpanel.jpg'),
          fit: BoxFit.cover,
        )),
      ),
    );
  }

  Widget _buildPrepare(
    BuildContext context,
    CookingCubit cubit,
    CookingState state,
  ) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.recipe.ingredients.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                value: state.checkedList[index],
                onChanged: (value) {
                  if (value != null) {
                    cubit.checkIngredient(index, value);
                  }
                },
                title: Text(state.scaledIngredient(index)),
              );
            },
          ),
        ),
        if (state.isAllChecked)
          ElevatedButton(
            onPressed: cubit.endPreparation,
            child: const Text(Strings.letsStart),
          )
      ],
    );
  }

  Widget _buildStep(
    BuildContext context,
    CookingCubit cubit,
    CookingState state,
  ) {
    final ingredients = state.stepIngredients;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: state.timers.keys
                .map((key) => timerCard(context, cubit, state, key))
                .toList(),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(state.stepContent),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.stepIngredientsLength,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: state.checkedList[index],
                  onChanged: (value) {
                    if (value != null) {
                      cubit.checkIngredient(index, value);
                    }
                  },
                  title: Text(ingredients[index].showScaled(state.scale)),
                );
              },
            ),
          ),
          Wrap(
            runSpacing: 8,
            children: state.stepTimers.entries
                .map((entry) => stepTimer(cubit, entry.key, entry.value))
                .toList(),
          ),
          ElevatedButton(
            onPressed: state.isAllChecked
                ? state.isLastStep
                    ? state.isReadyToEnd
                        ? cubit.endSteps
                        : null
                    : cubit.nextStep
                : null,
            child: Text(state.isLastStep
                ? state.isReadyToEnd
                    ? Strings.cookingEnd
                    : Strings.waitForTimers
                : Strings.nextStep),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(
    BuildContext context,
    CookingCubit cubit,
    CookingState state,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: Text(
              Strings.cookingTime(state.cookTime),
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back),
            onPressed: cubit.closeCooking,
            label: const Text(Strings.back),
          ),
        ],
      ),
    );
  }

  Widget stepTimer(
    CookingCubit cubit,
    String key,
    int timer,
  ) {
    return ElevatedButton.icon(
      onPressed: () => cubit.addTimer(key, timer),
      icon: const Icon(Icons.timer_rounded),
      label: Text('${timer.toString()} ${Strings.min}'),
    );
  }

  Widget timerCard(
    BuildContext context,
    CookingCubit cubit,
    CookingState state,
    String key,
  ) {
    return ElevatedButton.icon(
      onPressed: () {
        showDialog<void>(
            context: context,
            builder: (ctx) {
              return SimpleDialog(
                children: [
                  if (!cubit.isTimerInit(key))
                    MaterialButton(
                      onPressed: () {
                        cubit.runTimer(key);
                        Navigator.of(ctx).pop();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.play_arrow),
                          SizedBox(width: 8),
                          Text(Strings.start),
                        ],
                      ),
                    ),
                  if (cubit.isTimerInit(key))
                    MaterialButton(
                      onPressed: () {
                        cubit.pauseTimer(key);
                        Navigator.of(ctx).pop();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(cubit.isTimerPaused(key)
                              ? Icons.play_arrow
                              : Icons.pause),
                          const SizedBox(width: 8),
                          Text(
                            cubit.isTimerPaused(key)
                                ? Strings.resume
                                : Strings.pause,
                          ),
                        ],
                      ),
                    ),
                  MaterialButton(
                    onPressed: cubit.isTimerInit(key)
                        ? () {
                            cubit.addMinuteToTimer(key);
                            Navigator.of(ctx).pop();
                          }
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.more_time_outlined),
                        SizedBox(width: 8),
                        Text(Strings.addMinute),
                      ],
                    ),
                  ),
                ],
              );
            });
      },
      icon: const Icon(Icons.timer),
      label: Text(state.timerString(key)),
    );
  }
}
