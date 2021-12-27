// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) {
  return _RecipeStep.fromJson(json);
}

/// @nodoc
class _$RecipeStepTearOff {
  const _$RecipeStepTearOff();

  _RecipeStep call(
      {@HiveField(0) required String id,
      @HiveField(1) required String recipeId,
      @HiveField(2) required String content,
      @HiveField(3) Map<String, int> timers = const <String, int>{},
      @HiveField(4) List<String> ingredients = const <String>[]}) {
    return _RecipeStep(
      id: id,
      recipeId: recipeId,
      content: content,
      timers: timers,
      ingredients: ingredients,
    );
  }

  RecipeStep fromJson(Map<String, Object?> json) {
    return RecipeStep.fromJson(json);
  }
}

/// @nodoc
const $RecipeStep = _$RecipeStepTearOff();

/// @nodoc
mixin _$RecipeStep {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get recipeId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get content => throw _privateConstructorUsedError;
  @HiveField(3)
  Map<String, int> get timers => throw _privateConstructorUsedError;
  @HiveField(4)
  List<String> get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeStepCopyWith<RecipeStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStepCopyWith<$Res> {
  factory $RecipeStepCopyWith(
          RecipeStep value, $Res Function(RecipeStep) then) =
      _$RecipeStepCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String recipeId,
      @HiveField(2) String content,
      @HiveField(3) Map<String, int> timers,
      @HiveField(4) List<String> ingredients});
}

/// @nodoc
class _$RecipeStepCopyWithImpl<$Res> implements $RecipeStepCopyWith<$Res> {
  _$RecipeStepCopyWithImpl(this._value, this._then);

  final RecipeStep _value;
  // ignore: unused_field
  final $Res Function(RecipeStep) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? recipeId = freezed,
    Object? content = freezed,
    Object? timers = freezed,
    Object? ingredients = freezed,
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
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timers: timers == freezed
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$RecipeStepCopyWith<$Res> implements $RecipeStepCopyWith<$Res> {
  factory _$RecipeStepCopyWith(
          _RecipeStep value, $Res Function(_RecipeStep) then) =
      __$RecipeStepCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String recipeId,
      @HiveField(2) String content,
      @HiveField(3) Map<String, int> timers,
      @HiveField(4) List<String> ingredients});
}

/// @nodoc
class __$RecipeStepCopyWithImpl<$Res> extends _$RecipeStepCopyWithImpl<$Res>
    implements _$RecipeStepCopyWith<$Res> {
  __$RecipeStepCopyWithImpl(
      _RecipeStep _value, $Res Function(_RecipeStep) _then)
      : super(_value, (v) => _then(v as _RecipeStep));

  @override
  _RecipeStep get _value => super._value as _RecipeStep;

  @override
  $Res call({
    Object? id = freezed,
    Object? recipeId = freezed,
    Object? content = freezed,
    Object? timers = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_RecipeStep(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recipeId: recipeId == freezed
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timers: timers == freezed
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'RecipeStepAdapter')
class _$_RecipeStep implements _RecipeStep {
  _$_RecipeStep(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.recipeId,
      @HiveField(2) required this.content,
      @HiveField(3) this.timers = const <String, int>{},
      @HiveField(4) this.ingredients = const <String>[]});

  factory _$_RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeStepFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String recipeId;
  @override
  @HiveField(2)
  final String content;
  @JsonKey()
  @override
  @HiveField(3)
  final Map<String, int> timers;
  @JsonKey()
  @override
  @HiveField(4)
  final List<String> ingredients;

  @override
  String toString() {
    return 'RecipeStep(id: $id, recipeId: $recipeId, content: $content, timers: $timers, ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeStep &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.recipeId, recipeId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.timers, timers) &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(recipeId),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(timers),
      const DeepCollectionEquality().hash(ingredients));

  @JsonKey(ignore: true)
  @override
  _$RecipeStepCopyWith<_RecipeStep> get copyWith =>
      __$RecipeStepCopyWithImpl<_RecipeStep>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeStepToJson(this);
  }
}

abstract class _RecipeStep implements RecipeStep {
  factory _RecipeStep(
      {@HiveField(0) required String id,
      @HiveField(1) required String recipeId,
      @HiveField(2) required String content,
      @HiveField(3) Map<String, int> timers,
      @HiveField(4) List<String> ingredients}) = _$_RecipeStep;

  factory _RecipeStep.fromJson(Map<String, dynamic> json) =
      _$_RecipeStep.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get recipeId;
  @override
  @HiveField(2)
  String get content;
  @override
  @HiveField(3)
  Map<String, int> get timers;
  @override
  @HiveField(4)
  List<String> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$RecipeStepCopyWith<_RecipeStep> get copyWith =>
      throw _privateConstructorUsedError;
}
