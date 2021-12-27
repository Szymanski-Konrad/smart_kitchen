// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
class _$RecipeTearOff {
  const _$RecipeTearOff();

  _Recipe call(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required Category category,
      @HiveField(3) String? imagePath,
      @HiveField(4) String? notes,
      @HiveField(5) required String userId,
      @HiveField(6) double rating = 0.0,
      @HiveField(7) Map<String, double> votes = const <String, double>{},
      @HiveField(8) required List<Ingredient> ingredients,
      @HiveField(9) required List<RecipeStep> steps}) {
    return _Recipe(
      id: id,
      name: name,
      category: category,
      imagePath: imagePath,
      notes: notes,
      userId: userId,
      rating: rating,
      votes: votes,
      ingredients: ingredients,
      steps: steps,
    );
  }

  Recipe fromJson(Map<String, Object?> json) {
    return Recipe.fromJson(json);
  }
}

/// @nodoc
const $Recipe = _$RecipeTearOff();

/// @nodoc
mixin _$Recipe {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  Category get category => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get imagePath => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get notes => throw _privateConstructorUsedError;
  @HiveField(5)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(6)
  double get rating => throw _privateConstructorUsedError;
  @HiveField(7)
  Map<String, double> get votes => throw _privateConstructorUsedError;
  @HiveField(8)
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  @HiveField(9)
  List<RecipeStep> get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) Category category,
      @HiveField(3) String? imagePath,
      @HiveField(4) String? notes,
      @HiveField(5) String userId,
      @HiveField(6) double rating,
      @HiveField(7) Map<String, double> votes,
      @HiveField(8) List<Ingredient> ingredients,
      @HiveField(9) List<RecipeStep> steps});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res> implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  final Recipe _value;
  // ignore: unused_field
  final $Res Function(Recipe) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? imagePath = freezed,
    Object? notes = freezed,
    Object? userId = freezed,
    Object? rating = freezed,
    Object? votes = freezed,
    Object? ingredients = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      votes: votes == freezed
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
    ));
  }
}

/// @nodoc
abstract class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) then) =
      __$RecipeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) Category category,
      @HiveField(3) String? imagePath,
      @HiveField(4) String? notes,
      @HiveField(5) String userId,
      @HiveField(6) double rating,
      @HiveField(7) Map<String, double> votes,
      @HiveField(8) List<Ingredient> ingredients,
      @HiveField(9) List<RecipeStep> steps});
}

/// @nodoc
class __$RecipeCopyWithImpl<$Res> extends _$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(_Recipe _value, $Res Function(_Recipe) _then)
      : super(_value, (v) => _then(v as _Recipe));

  @override
  _Recipe get _value => super._value as _Recipe;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? imagePath = freezed,
    Object? notes = freezed,
    Object? userId = freezed,
    Object? rating = freezed,
    Object? votes = freezed,
    Object? ingredients = freezed,
    Object? steps = freezed,
  }) {
    return _then(_Recipe(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      votes: votes == freezed
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'RecipeAdapter')
class _$_Recipe implements _Recipe {
  _$_Recipe(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.category,
      @HiveField(3) this.imagePath,
      @HiveField(4) this.notes,
      @HiveField(5) required this.userId,
      @HiveField(6) this.rating = 0.0,
      @HiveField(7) this.votes = const <String, double>{},
      @HiveField(8) required this.ingredients,
      @HiveField(9) required this.steps});

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final Category category;
  @override
  @HiveField(3)
  final String? imagePath;
  @override
  @HiveField(4)
  final String? notes;
  @override
  @HiveField(5)
  final String userId;
  @JsonKey()
  @override
  @HiveField(6)
  final double rating;
  @JsonKey()
  @override
  @HiveField(7)
  final Map<String, double> votes;
  @override
  @HiveField(8)
  final List<Ingredient> ingredients;
  @override
  @HiveField(9)
  final List<RecipeStep> steps;

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, category: $category, imagePath: $imagePath, notes: $notes, userId: $userId, rating: $rating, votes: $votes, ingredients: $ingredients, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recipe &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.votes, votes) &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients) &&
            const DeepCollectionEquality().equals(other.steps, steps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(votes),
      const DeepCollectionEquality().hash(ingredients),
      const DeepCollectionEquality().hash(steps));

  @JsonKey(ignore: true)
  @override
  _$RecipeCopyWith<_Recipe> get copyWith =>
      __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(this);
  }
}

abstract class _Recipe implements Recipe {
  factory _Recipe(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required Category category,
      @HiveField(3) String? imagePath,
      @HiveField(4) String? notes,
      @HiveField(5) required String userId,
      @HiveField(6) double rating,
      @HiveField(7) Map<String, double> votes,
      @HiveField(8) required List<Ingredient> ingredients,
      @HiveField(9) required List<RecipeStep> steps}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  Category get category;
  @override
  @HiveField(3)
  String? get imagePath;
  @override
  @HiveField(4)
  String? get notes;
  @override
  @HiveField(5)
  String get userId;
  @override
  @HiveField(6)
  double get rating;
  @override
  @HiveField(7)
  Map<String, double> get votes;
  @override
  @HiveField(8)
  List<Ingredient> get ingredients;
  @override
  @HiveField(9)
  List<RecipeStep> get steps;
  @override
  @JsonKey(ignore: true)
  _$RecipeCopyWith<_Recipe> get copyWith => throw _privateConstructorUsedError;
}
