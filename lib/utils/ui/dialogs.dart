import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/strings.dart';

abstract class Dialogs {
  static Widget burnCaloriesDialog(double kcal) {
    return SimpleDialog(
      title: Center(child: Text(Strings.activitesTime(kcal))),
      contentPadding: const EdgeInsets.all(16),
      children: [
        Wrap(
          children: [
            ListTile(
              dense: true,
              leading: const Icon(Icons.fitness_center_outlined),
              title: Text('${(kcal / 7).toStringAsFixed(0)} ${Strings.min}'),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.pool),
              title: Text('${(kcal / 7).toStringAsFixed(0)} ${Strings.min}'),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.stairs),
              title: Text('${(kcal / 10).toStringAsFixed(0)} ${Strings.min}'),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.run_circle_outlined),
              title: Text('${(kcal / 17).toStringAsFixed(0)} ${Strings.min}'),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.directions_bike_outlined),
              title: Text('${(kcal / 4).toStringAsFixed(0)} ${Strings.min}'),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.bed),
              title: Text('${kcal.toStringAsFixed(0)} ${Strings.min}'),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.pedal_bike),
              title: Text('${(kcal / 8).toStringAsFixed(0)} ${Strings.min}'),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.directions_walk_outlined),
              title: Text(
                '${(kcal * 10000 / 400).toStringAsFixed(0)} ${Strings.steps}',
              ),
            ),
          ],
        )
      ],
    );
  }
}
