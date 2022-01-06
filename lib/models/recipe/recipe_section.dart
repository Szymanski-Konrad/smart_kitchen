import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_kitchen/app/resources/hive_types.dart';
import 'package:uuid/uuid.dart';

part 'recipe_section.freezed.dart';
part 'recipe_section.g.dart';

@freezed
class RecipeSection with _$RecipeSection {
  @HiveType(typeId: HiveTypeId.h5, adapterName: 'RecipeSectionAdapter')
  factory RecipeSection({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
  }) = _RecipeSection;

  factory RecipeSection.withId({required String name}) {
    return RecipeSection(
      id: const Uuid().v1(),
      name: name,
    );
  }

  factory RecipeSection.fromJson(Map<String, dynamic> json) =>
      _$RecipeSectionFromJson(json);
}
