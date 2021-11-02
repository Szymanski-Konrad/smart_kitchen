// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'new_recipe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewRecipeStateTearOff {
  const _$NewRecipeStateTearOff();

  _NewRecipeState call(
      {required String id,
      required String uid,
      required String name,
      Category category = Category.notAssigned,
      String imagePath = '',
      String notes = '',
      double rating = 0.0,
      Map<String, double> votes = const <String, double>{},
      required List<Ingredient> ingredients,
      required List<RecipeStep> steps,
      bool isSaving = false,
      bool isEditing = false}) {
    return _NewRecipeState(
      id: id,
      uid: uid,
      name: name,
      category: category,
      imagePath: imagePath,
      notes: notes,
      rating: rating,
      votes: votes,
      ingredients: ingredients,
      steps: steps,
      isSaving: isSaving,
      isEditing: isEditing,
    );
  }
}

/// @nodoc
const $NewRecipeState = _$NewRecipeStateTearOff();

/// @nodoc
mixin _$NewRecipeState {
  String get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  Map<String, double> get votes => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  List<RecipeStep> get steps => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewRecipeStateCopyWith<NewRecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRecipeStateCopyWith<$Res> {
  factory $NewRecipeStateCopyWith(
          NewRecipeState value, $Res Function(NewRecipeState) then) =
      _$NewRecipeStateCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String uid,
      String name,
      Category category,
      String imagePath,
      String notes,
      double rating,
      Map<String, double> votes,
      List<Ingredient> ingredients,
      List<RecipeStep> steps,
      bool isSaving,
      bool isEditing});
}

/// @nodoc
class _$NewRecipeStateCopyWithImpl<$Res>
    implements $NewRecipeStateCopyWith<$Res> {
  _$NewRecipeStateCopyWithImpl(this._value, this._then);

  final NewRecipeState _value;
  // ignore: unused_field
  final $Res Function(NewRecipeState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? imagePath = freezed,
    Object? notes = freezed,
    Object? rating = freezed,
    Object? votes = freezed,
    Object? ingredients = freezed,
    Object? steps = freezed,
    Object? isSaving = freezed,
    Object? isEditing = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
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
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$NewRecipeStateCopyWith<$Res>
    implements $NewRecipeStateCopyWith<$Res> {
  factory _$NewRecipeStateCopyWith(
          _NewRecipeState value, $Res Function(_NewRecipeState) then) =
      __$NewRecipeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String uid,
      String name,
      Category category,
      String imagePath,
      String notes,
      double rating,
      Map<String, double> votes,
      List<Ingredient> ingredients,
      List<RecipeStep> steps,
      bool isSaving,
      bool isEditing});
}

/// @nodoc
class __$NewRecipeStateCopyWithImpl<$Res>
    extends _$NewRecipeStateCopyWithImpl<$Res>
    implements _$NewRecipeStateCopyWith<$Res> {
  __$NewRecipeStateCopyWithImpl(
      _NewRecipeState _value, $Res Function(_NewRecipeState) _then)
      : super(_value, (v) => _then(v as _NewRecipeState));

  @override
  _NewRecipeState get _value => super._value as _NewRecipeState;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? imagePath = freezed,
    Object? notes = freezed,
    Object? rating = freezed,
    Object? votes = freezed,
    Object? ingredients = freezed,
    Object? steps = freezed,
    Object? isSaving = freezed,
    Object? isEditing = freezed,
  }) {
    return _then(_NewRecipeState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
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
              as String,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NewRecipeState implements _NewRecipeState {
  _$_NewRecipeState(
      {required this.id,
      required this.uid,
      required this.name,
      this.category = Category.notAssigned,
      this.imagePath = '',
      this.notes = '',
      this.rating = 0.0,
      this.votes = const <String, double>{},
      required this.ingredients,
      required this.steps,
      this.isSaving = false,
      this.isEditing = false});

  @override
  final String id;
  @override
  final String uid;
  @override
  final String name;
  @JsonKey(defaultValue: Category.notAssigned)
  @override
  final Category category;
  @JsonKey(defaultValue: '')
  @override
  final String imagePath;
  @JsonKey(defaultValue: '')
  @override
  final String notes;
  @JsonKey(defaultValue: 0.0)
  @override
  final double rating;
  @JsonKey(defaultValue: const <String, double>{})
  @override
  final Map<String, double> votes;
  @override
  final List<Ingredient> ingredients;
  @override
  final List<RecipeStep> steps;
  @JsonKey(defaultValue: false)
  @override
  final bool isSaving;
  @JsonKey(defaultValue: false)
  @override
  final bool isEditing;

  @override
  String toString() {
    return 'NewRecipeState(id: $id, uid: $uid, name: $name, category: $category, imagePath: $imagePath, notes: $notes, rating: $rating, votes: $votes, ingredients: $ingredients, steps: $steps, isSaving: $isSaving, isEditing: $isEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewRecipeState &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.imagePath, imagePath) ||
                const DeepCollectionEquality()
                    .equals(other.imagePath, imagePath)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.votes, votes) ||
                const DeepCollectionEquality().equals(other.votes, votes)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)) &&
            (identical(other.steps, steps) ||
                const DeepCollectionEquality().equals(other.steps, steps)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality()
                    .equals(other.isSaving, isSaving)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality()
                    .equals(other.isEditing, isEditing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(imagePath) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(votes) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(steps) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(isEditing);

  @JsonKey(ignore: true)
  @override
  _$NewRecipeStateCopyWith<_NewRecipeState> get copyWith =>
      __$NewRecipeStateCopyWithImpl<_NewRecipeState>(this, _$identity);
}

abstract class _NewRecipeState implements NewRecipeState {
  factory _NewRecipeState(
      {required String id,
      required String uid,
      required String name,
      Category category,
      String imagePath,
      String notes,
      double rating,
      Map<String, double> votes,
      required List<Ingredient> ingredients,
      required List<RecipeStep> steps,
      bool isSaving,
      bool isEditing}) = _$_NewRecipeState;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  Category get category => throw _privateConstructorUsedError;
  @override
  String get imagePath => throw _privateConstructorUsedError;
  @override
  String get notes => throw _privateConstructorUsedError;
  @override
  double get rating => throw _privateConstructorUsedError;
  @override
  Map<String, double> get votes => throw _privateConstructorUsedError;
  @override
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  @override
  List<RecipeStep> get steps => throw _privateConstructorUsedError;
  @override
  bool get isSaving => throw _privateConstructorUsedError;
  @override
  bool get isEditing => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewRecipeStateCopyWith<_NewRecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}
