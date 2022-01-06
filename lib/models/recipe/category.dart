import 'package:hive/hive.dart';
import 'package:smart_kitchen/app/resources/hive_types.dart';
import 'package:smart_kitchen/app/resources/strings.dart';

part 'category.g.dart';

@HiveType(typeId: HiveTypeId.h4, adapterName: 'CategoryAdapter')
enum Category {
  @HiveField(0)
  breakfast,
  @HiveField(1)
  lunch,
  @HiveField(2)
  dinner,
  @HiveField(3)
  cocktail,
  @HiveField(4)
  dessert,
  @HiveField(5)
  cake,
  @HiveField(6)
  fish,
  @HiveField(7)
  salad,
  @HiveField(8)
  drink,
  @HiveField(9)
  jam,
  @HiveField(10)
  notAssigned,
}

extension CategoryExtension on Category {
  String get name {
    switch (this) {
      case Category.breakfast:
        return Strings.breakfast;
      case Category.lunch:
        return Strings.lunch;
      case Category.dinner:
        return Strings.dinner;
      case Category.cocktail:
        return Strings.cocktail;
      case Category.dessert:
        return Strings.dessert;
      case Category.cake:
        return Strings.cake;
      case Category.fish:
        return Strings.fish;
      case Category.salad:
        return Strings.salad;
      case Category.drink:
        return Strings.drink;
      case Category.jam:
        return Strings.jam;
      case Category.notAssigned:
        return Strings.notAssigned;
    }
  }
}
