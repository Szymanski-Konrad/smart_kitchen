// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'recipes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecipesStateTearOff {
  const _$RecipesStateTearOff();

  _RecipesState call(
      {required List<Recipe> recipes,
      String? searchString,
      Category selectedCategory = Category.breakfast,
      String? currentUserId}) {
    return _RecipesState(
      recipes: recipes,
      searchString: searchString,
      selectedCategory: selectedCategory,
      currentUserId: currentUserId,
    );
  }
}

/// @nodoc
const $RecipesState = _$RecipesStateTearOff();

/// @nodoc
mixin _$RecipesState {
  List<Recipe> get recipes => throw _privateConstructorUsedError;
  String? get searchString => throw _privateConstructorUsedError;
  Category get selectedCategory => throw _privateConstructorUsedError;
  String? get currentUserId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipesStateCopyWith<RecipesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipesStateCopyWith<$Res> {
  factory $RecipesStateCopyWith(
          RecipesState value, $Res Function(RecipesState) then) =
      _$RecipesStateCopyWithImpl<$Res>;
  $Res call(
      {List<Recipe> recipes,
      String? searchString,
      Category selectedCategory,
      String? currentUserId});
}

/// @nodoc
class _$RecipesStateCopyWithImpl<$Res> implements $RecipesStateCopyWith<$Res> {
  _$RecipesStateCopyWithImpl(this._value, this._then);

  final RecipesState _value;
  // ignore: unused_field
  final $Res Function(RecipesState) _then;

  @override
  $Res call({
    Object? recipes = freezed,
    Object? searchString = freezed,
    Object? selectedCategory = freezed,
    Object? currentUserId = freezed,
  }) {
    return _then(_value.copyWith(
      recipes: recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      searchString: searchString == freezed
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as Category,
      currentUserId: currentUserId == freezed
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RecipesStateCopyWith<$Res>
    implements $RecipesStateCopyWith<$Res> {
  factory _$RecipesStateCopyWith(
          _RecipesState value, $Res Function(_RecipesState) then) =
      __$RecipesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Recipe> recipes,
      String? searchString,
      Category selectedCategory,
      String? currentUserId});
}

/// @nodoc
class __$RecipesStateCopyWithImpl<$Res> extends _$RecipesStateCopyWithImpl<$Res>
    implements _$RecipesStateCopyWith<$Res> {
  __$RecipesStateCopyWithImpl(
      _RecipesState _value, $Res Function(_RecipesState) _then)
      : super(_value, (v) => _then(v as _RecipesState));

  @override
  _RecipesState get _value => super._value as _RecipesState;

  @override
  $Res call({
    Object? recipes = freezed,
    Object? searchString = freezed,
    Object? selectedCategory = freezed,
    Object? currentUserId = freezed,
  }) {
    return _then(_RecipesState(
      recipes: recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      searchString: searchString == freezed
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as Category,
      currentUserId: currentUserId == freezed
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RecipesState implements _RecipesState {
  _$_RecipesState(
      {required this.recipes,
      this.searchString,
      this.selectedCategory = Category.breakfast,
      this.currentUserId});

  @override
  final List<Recipe> recipes;
  @override
  final String? searchString;
  @JsonKey(defaultValue: Category.breakfast)
  @override
  final Category selectedCategory;
  @override
  final String? currentUserId;

  @override
  String toString() {
    return 'RecipesState(recipes: $recipes, searchString: $searchString, selectedCategory: $selectedCategory, currentUserId: $currentUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecipesState &&
            (identical(other.recipes, recipes) ||
                const DeepCollectionEquality()
                    .equals(other.recipes, recipes)) &&
            (identical(other.searchString, searchString) ||
                const DeepCollectionEquality()
                    .equals(other.searchString, searchString)) &&
            (identical(other.selectedCategory, selectedCategory) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCategory, selectedCategory)) &&
            (identical(other.currentUserId, currentUserId) ||
                const DeepCollectionEquality()
                    .equals(other.currentUserId, currentUserId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recipes) ^
      const DeepCollectionEquality().hash(searchString) ^
      const DeepCollectionEquality().hash(selectedCategory) ^
      const DeepCollectionEquality().hash(currentUserId);

  @JsonKey(ignore: true)
  @override
  _$RecipesStateCopyWith<_RecipesState> get copyWith =>
      __$RecipesStateCopyWithImpl<_RecipesState>(this, _$identity);
}

abstract class _RecipesState implements RecipesState {
  factory _RecipesState(
      {required List<Recipe> recipes,
      String? searchString,
      Category selectedCategory,
      String? currentUserId}) = _$_RecipesState;

  @override
  List<Recipe> get recipes => throw _privateConstructorUsedError;
  @override
  String? get searchString => throw _privateConstructorUsedError;
  @override
  Category get selectedCategory => throw _privateConstructorUsedError;
  @override
  String? get currentUserId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecipesStateCopyWith<_RecipesState> get copyWith =>
      throw _privateConstructorUsedError;
}
