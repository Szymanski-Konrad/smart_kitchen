// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<_$_Recipe> {
  @override
  final int typeId = 0;

  @override
  _$_Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Recipe(
      id: fields[0] as String,
      name: fields[1] as String,
      category: fields[2] as Category,
      imagePath: fields[3] as String?,
      notes: fields[4] as String?,
      userId: fields[5] as String,
      rating: fields[6] as double,
      votes: (fields[7] as Map).cast<String, double>(),
      ingredients: (fields[8] as List).cast<Ingredient>(),
      steps: (fields[9] as List).cast<RecipeStep>(),
      sections: (fields[10] as List).cast<RecipeSection>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_Recipe obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.notes)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.votes)
      ..writeByte(8)
      ..write(obj.ingredients)
      ..writeByte(9)
      ..write(obj.steps)
      ..writeByte(10)
      ..write(obj.sections);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      id: json['id'] as String,
      name: json['name'] as String,
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      imagePath: json['imagePath'] as String?,
      notes: json['notes'] as String?,
      userId: json['userId'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      votes: (json['votes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const <String, double>{},
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => RecipeSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RecipeSection>[],
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$CategoryEnumMap[instance.category],
      'imagePath': instance.imagePath,
      'notes': instance.notes,
      'userId': instance.userId,
      'rating': instance.rating,
      'votes': instance.votes,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'sections': instance.sections,
    };

const _$CategoryEnumMap = {
  Category.breakfast: 'breakfast',
  Category.lunch: 'lunch',
  Category.dinner: 'dinner',
  Category.cocktail: 'cocktail',
  Category.dessert: 'dessert',
  Category.cake: 'cake',
  Category.fish: 'fish',
  Category.salad: 'salad',
  Category.drink: 'drink',
  Category.jam: 'jam',
  Category.notAssigned: 'notAssigned',
};
