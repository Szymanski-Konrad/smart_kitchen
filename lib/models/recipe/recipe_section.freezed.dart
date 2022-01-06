// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeSection _$RecipeSectionFromJson(Map<String, dynamic> json) {
  return _RecipeSection.fromJson(json);
}

/// @nodoc
class _$RecipeSectionTearOff {
  const _$RecipeSectionTearOff();

  _RecipeSection call(
      {@HiveField(0) required String id, @HiveField(1) required String name}) {
    return _RecipeSection(
      id: id,
      name: name,
    );
  }

  RecipeSection fromJson(Map<String, Object?> json) {
    return RecipeSection.fromJson(json);
  }
}

/// @nodoc
const $RecipeSection = _$RecipeSectionTearOff();

/// @nodoc
mixin _$RecipeSection {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeSectionCopyWith<RecipeSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeSectionCopyWith<$Res> {
  factory $RecipeSectionCopyWith(
          RecipeSection value, $Res Function(RecipeSection) then) =
      _$RecipeSectionCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String id, @HiveField(1) String name});
}

/// @nodoc
class _$RecipeSectionCopyWithImpl<$Res>
    implements $RecipeSectionCopyWith<$Res> {
  _$RecipeSectionCopyWithImpl(this._value, this._then);

  final RecipeSection _value;
  // ignore: unused_field
  final $Res Function(RecipeSection) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$RecipeSectionCopyWith<$Res>
    implements $RecipeSectionCopyWith<$Res> {
  factory _$RecipeSectionCopyWith(
          _RecipeSection value, $Res Function(_RecipeSection) then) =
      __$RecipeSectionCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String id, @HiveField(1) String name});
}

/// @nodoc
class __$RecipeSectionCopyWithImpl<$Res>
    extends _$RecipeSectionCopyWithImpl<$Res>
    implements _$RecipeSectionCopyWith<$Res> {
  __$RecipeSectionCopyWithImpl(
      _RecipeSection _value, $Res Function(_RecipeSection) _then)
      : super(_value, (v) => _then(v as _RecipeSection));

  @override
  _RecipeSection get _value => super._value as _RecipeSection;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_RecipeSection(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeId.h5, adapterName: 'RecipeSectionAdapter')
class _$_RecipeSection implements _RecipeSection {
  _$_RecipeSection(
      {@HiveField(0) required this.id, @HiveField(1) required this.name});

  factory _$_RecipeSection.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeSectionFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;

  @override
  String toString() {
    return 'RecipeSection(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeSection &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$RecipeSectionCopyWith<_RecipeSection> get copyWith =>
      __$RecipeSectionCopyWithImpl<_RecipeSection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeSectionToJson(this);
  }
}

abstract class _RecipeSection implements RecipeSection {
  factory _RecipeSection(
      {@HiveField(0) required String id,
      @HiveField(1) required String name}) = _$_RecipeSection;

  factory _RecipeSection.fromJson(Map<String, dynamic> json) =
      _$_RecipeSection.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$RecipeSectionCopyWith<_RecipeSection> get copyWith =>
      throw _privateConstructorUsedError;
}
