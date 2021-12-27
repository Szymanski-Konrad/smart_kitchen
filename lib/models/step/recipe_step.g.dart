// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeStepAdapter extends TypeAdapter<_$_RecipeStep> {
  @override
  final int typeId = 2;

  @override
  _$_RecipeStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_RecipeStep(
      id: fields[0] as String,
      recipeId: fields[1] as String,
      content: fields[2] as String,
      timers: (fields[3] as Map).cast<String, int>(),
      ingredients: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_RecipeStep obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.recipeId)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.timers)
      ..writeByte(4)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeStep _$$_RecipeStepFromJson(Map<String, dynamic> json) =>
    _$_RecipeStep(
      id: json['id'] as String,
      recipeId: json['recipeId'] as String,
      content: json['content'] as String,
      timers: (json['timers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as int),
          ) ??
          const <String, int>{},
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$_RecipeStepToJson(_$_RecipeStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeId': instance.recipeId,
      'content': instance.content,
      'timers': instance.timers,
      'ingredients': instance.ingredients,
    };
