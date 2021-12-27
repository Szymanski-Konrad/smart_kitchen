// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlannerDayAdapter extends TypeAdapter<_$_PlannerDay> {
  @override
  final int typeId = 3;

  @override
  _$_PlannerDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PlannerDay(
      id: fields[0] as String,
      date: fields[1] as DateTime,
      dishes: (fields[2] as List).cast<Recipe>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_PlannerDay obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.dishes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlannerDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlannerDay _$$_PlannerDayFromJson(Map<String, dynamic> json) =>
    _$_PlannerDay(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      dishes: (json['dishes'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlannerDayToJson(_$_PlannerDay instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'dishes': instance.dishes,
    };
