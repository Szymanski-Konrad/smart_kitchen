// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'planner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlannerDay _$PlannerDayFromJson(Map<String, dynamic> json) {
  return _PlannerDay.fromJson(json);
}

/// @nodoc
class _$PlannerDayTearOff {
  const _$PlannerDayTearOff();

  _PlannerDay call(
      {@HiveField(0) String? id,
      @HiveField(1) required DateTime date,
      @HiveField(2) required List<Recipe> dishes}) {
    return _PlannerDay(
      id: id,
      date: date,
      dishes: dishes,
    );
  }

  PlannerDay fromJson(Map<String, Object> json) {
    return PlannerDay.fromJson(json);
  }
}

/// @nodoc
const $PlannerDay = _$PlannerDayTearOff();

/// @nodoc
mixin _$PlannerDay {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(2)
  List<Recipe> get dishes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlannerDayCopyWith<PlannerDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerDayCopyWith<$Res> {
  factory $PlannerDayCopyWith(
          PlannerDay value, $Res Function(PlannerDay) then) =
      _$PlannerDayCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) DateTime date,
      @HiveField(2) List<Recipe> dishes});
}

/// @nodoc
class _$PlannerDayCopyWithImpl<$Res> implements $PlannerDayCopyWith<$Res> {
  _$PlannerDayCopyWithImpl(this._value, this._then);

  final PlannerDay _value;
  // ignore: unused_field
  final $Res Function(PlannerDay) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? dishes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dishes: dishes == freezed
          ? _value.dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc
abstract class _$PlannerDayCopyWith<$Res> implements $PlannerDayCopyWith<$Res> {
  factory _$PlannerDayCopyWith(
          _PlannerDay value, $Res Function(_PlannerDay) then) =
      __$PlannerDayCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) DateTime date,
      @HiveField(2) List<Recipe> dishes});
}

/// @nodoc
class __$PlannerDayCopyWithImpl<$Res> extends _$PlannerDayCopyWithImpl<$Res>
    implements _$PlannerDayCopyWith<$Res> {
  __$PlannerDayCopyWithImpl(
      _PlannerDay _value, $Res Function(_PlannerDay) _then)
      : super(_value, (v) => _then(v as _PlannerDay));

  @override
  _PlannerDay get _value => super._value as _PlannerDay;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? dishes = freezed,
  }) {
    return _then(_PlannerDay(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dishes: dishes == freezed
          ? _value.dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3, adapterName: 'PlannerDayAdapter')
class _$_PlannerDay implements _PlannerDay {
  _$_PlannerDay(
      {@HiveField(0) this.id,
      @HiveField(1) required this.date,
      @HiveField(2) required this.dishes});

  factory _$_PlannerDay.fromJson(Map<String, dynamic> json) =>
      _$_$_PlannerDayFromJson(json);

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final DateTime date;
  @override
  @HiveField(2)
  final List<Recipe> dishes;

  @override
  String toString() {
    return 'PlannerDay(id: $id, date: $date, dishes: $dishes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlannerDay &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.dishes, dishes) ||
                const DeepCollectionEquality().equals(other.dishes, dishes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(dishes);

  @JsonKey(ignore: true)
  @override
  _$PlannerDayCopyWith<_PlannerDay> get copyWith =>
      __$PlannerDayCopyWithImpl<_PlannerDay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlannerDayToJson(this);
  }
}

abstract class _PlannerDay implements PlannerDay {
  factory _PlannerDay(
      {@HiveField(0) String? id,
      @HiveField(1) required DateTime date,
      @HiveField(2) required List<Recipe> dishes}) = _$_PlannerDay;

  factory _PlannerDay.fromJson(Map<String, dynamic> json) =
      _$_PlannerDay.fromJson;

  @override
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  DateTime get date => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  List<Recipe> get dishes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlannerDayCopyWith<_PlannerDay> get copyWith =>
      throw _privateConstructorUsedError;
}
