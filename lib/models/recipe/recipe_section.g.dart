// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_section.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeSectionAdapter extends TypeAdapter<_$_RecipeSection> {
  @override
  final int typeId = 5;

  @override
  _$_RecipeSection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_RecipeSection(
      id: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_RecipeSection obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeSectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeSection _$$_RecipeSectionFromJson(Map<String, dynamic> json) =>
    _$_RecipeSection(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_RecipeSectionToJson(_$_RecipeSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
