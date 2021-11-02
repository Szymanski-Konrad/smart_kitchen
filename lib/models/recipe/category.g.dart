// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 4;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.breakfast;
      case 1:
        return Category.lunch;
      case 2:
        return Category.dinner;
      case 3:
        return Category.cocktail;
      case 4:
        return Category.dessert;
      case 5:
        return Category.cake;
      case 6:
        return Category.fish;
      case 7:
        return Category.salad;
      case 8:
        return Category.drink;
      case 9:
        return Category.jam;
      case 10:
        return Category.notAssigned;
      default:
        return Category.breakfast;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.breakfast:
        writer.writeByte(0);
        break;
      case Category.lunch:
        writer.writeByte(1);
        break;
      case Category.dinner:
        writer.writeByte(2);
        break;
      case Category.cocktail:
        writer.writeByte(3);
        break;
      case Category.dessert:
        writer.writeByte(4);
        break;
      case Category.cake:
        writer.writeByte(5);
        break;
      case Category.fish:
        writer.writeByte(6);
        break;
      case Category.salad:
        writer.writeByte(7);
        break;
      case Category.drink:
        writer.writeByte(8);
        break;
      case Category.jam:
        writer.writeByte(9);
        break;
      case Category.notAssigned:
        writer.writeByte(10);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
