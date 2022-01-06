// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
class _$IngredientTearOff {
  const _$IngredientTearOff();

  _Ingredient call(
      {@HiveField(0) required String id,
      @HiveField(1) required String recipeId,
      @HiveField(2) required String name,
      @HiveField(3) String? unit,
      @HiveField(4) double? amount,
      @HiveField(5) String? sectionId}) {
    return _Ingredient(
      id: id,
      recipeId: recipeId,
      name: name,
      unit: unit,
      amount: amount,
      sectionId: sectionId,
    );
  }

  Ingredient fromJson(Map<String, Object?> json) {
    return Ingredient.fromJson(json);
  }
}

/// @nodoc
const $Ingredient = _$IngredientTearOff();

/// @nodoc
mixin _$Ingredient {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get recipeId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get unit => throw _privateConstructorUsedError;
  @HiveField(4)
  double? get amount => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get sectionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String recipeId,
      @HiveField(2) String name,
      @HiveField(3) String? unit,
      @HiveField(4) double? amount,
      @HiveField(5) String? sectionId});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res> implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  final Ingredient _value;
  // ignore: unused_field
  final $Res Function(Ingredient) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? recipeId = freezed,
    Object? name = freezed,
    Object? unit = freezed,
    Object? amount = freezed,
    Object? sectionId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recipeId: recipeId == freezed
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      sectionId: sectionId == freezed
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(
          _Ingredient value, $Res Function(_Ingredient) then) =
      __$IngredientCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String recipeId,
      @HiveField(2) String name,
      @HiveField(3) String? unit,
      @HiveField(4) double? amount,
      @HiveField(5) String? sectionId});
}

/// @nodoc
class __$IngredientCopyWithImpl<$Res> extends _$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(
      _Ingredient _value, $Res Function(_Ingredient) _then)
      : super(_value, (v) => _then(v as _Ingredient));

  @override
  _Ingredient get _value => super._value as _Ingredient;

  @override
  $Res call({
    Object? id = freezed,
    Object? recipeId = freezed,
    Object? name = freezed,
    Object? unit = freezed,
    Object? amount = freezed,
    Object? sectionId = freezed,
  }) {
    return _then(_Ingredient(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recipeId: recipeId == freezed
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      sectionId: sectionId == freezed
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeId.h1, adapterName: 'IngredientAdapter')
class _$_Ingredient implements _Ingredient {
  _$_Ingredient(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.recipeId,
      @HiveField(2) required this.name,
      @HiveField(3) this.unit,
      @HiveField(4) this.amount,
      @HiveField(5) this.sectionId});

  factory _$_Ingredient.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String recipeId;
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  final String? unit;
  @override
  @HiveField(4)
  final double? amount;
  @override
  @HiveField(5)
  final String? sectionId;

  @override
  String toString() {
    return 'Ingredient(id: $id, recipeId: $recipeId, name: $name, unit: $unit, amount: $amount, sectionId: $sectionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ingredient &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.recipeId, recipeId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.unit, unit) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.sectionId, sectionId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(recipeId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(unit),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(sectionId));

  @JsonKey(ignore: true)
  @override
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientToJson(this);
  }
}

abstract class _Ingredient implements Ingredient {
  factory _Ingredient(
      {@HiveField(0) required String id,
      @HiveField(1) required String recipeId,
      @HiveField(2) required String name,
      @HiveField(3) String? unit,
      @HiveField(4) double? amount,
      @HiveField(5) String? sectionId}) = _$_Ingredient;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$_Ingredient.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get recipeId;
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  String? get unit;
  @override
  @HiveField(4)
  double? get amount;
  @override
  @HiveField(5)
  String? get sectionId;
  @override
  @JsonKey(ignore: true)
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}
