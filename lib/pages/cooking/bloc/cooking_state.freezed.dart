// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cooking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CookingStateTearOff {
  const _$CookingStateTearOff();

  _CookingState call(
      {required Recipe recipe,
      required double scale,
      required DateTime startTime,
      required DateTime endTime,
      int step = 0,
      Map<String, int> timers = const <String, int>{},
      CookingStatus status = CookingStatus.prepare,
      List<bool> checkedList = const <bool>[]}) {
    return _CookingState(
      recipe: recipe,
      scale: scale,
      startTime: startTime,
      endTime: endTime,
      step: step,
      timers: timers,
      status: status,
      checkedList: checkedList,
    );
  }
}

/// @nodoc
const $CookingState = _$CookingStateTearOff();

/// @nodoc
mixin _$CookingState {
  Recipe get recipe => throw _privateConstructorUsedError;
  double get scale => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  Map<String, int> get timers => throw _privateConstructorUsedError;
  CookingStatus get status => throw _privateConstructorUsedError;
  List<bool> get checkedList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CookingStateCopyWith<CookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CookingStateCopyWith<$Res> {
  factory $CookingStateCopyWith(
          CookingState value, $Res Function(CookingState) then) =
      _$CookingStateCopyWithImpl<$Res>;
  $Res call(
      {Recipe recipe,
      double scale,
      DateTime startTime,
      DateTime endTime,
      int step,
      Map<String, int> timers,
      CookingStatus status,
      List<bool> checkedList});

  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class _$CookingStateCopyWithImpl<$Res> implements $CookingStateCopyWith<$Res> {
  _$CookingStateCopyWithImpl(this._value, this._then);

  final CookingState _value;
  // ignore: unused_field
  final $Res Function(CookingState) _then;

  @override
  $Res call({
    Object? recipe = freezed,
    Object? scale = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? step = freezed,
    Object? timers = freezed,
    Object? status = freezed,
    Object? checkedList = freezed,
  }) {
    return _then(_value.copyWith(
      recipe: recipe == freezed
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
      scale: scale == freezed
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      timers: timers == freezed
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CookingStatus,
      checkedList: checkedList == freezed
          ? _value.checkedList
          : checkedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }

  @override
  $RecipeCopyWith<$Res> get recipe {
    return $RecipeCopyWith<$Res>(_value.recipe, (value) {
      return _then(_value.copyWith(recipe: value));
    });
  }
}

/// @nodoc
abstract class _$CookingStateCopyWith<$Res>
    implements $CookingStateCopyWith<$Res> {
  factory _$CookingStateCopyWith(
          _CookingState value, $Res Function(_CookingState) then) =
      __$CookingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Recipe recipe,
      double scale,
      DateTime startTime,
      DateTime endTime,
      int step,
      Map<String, int> timers,
      CookingStatus status,
      List<bool> checkedList});

  @override
  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class __$CookingStateCopyWithImpl<$Res> extends _$CookingStateCopyWithImpl<$Res>
    implements _$CookingStateCopyWith<$Res> {
  __$CookingStateCopyWithImpl(
      _CookingState _value, $Res Function(_CookingState) _then)
      : super(_value, (v) => _then(v as _CookingState));

  @override
  _CookingState get _value => super._value as _CookingState;

  @override
  $Res call({
    Object? recipe = freezed,
    Object? scale = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? step = freezed,
    Object? timers = freezed,
    Object? status = freezed,
    Object? checkedList = freezed,
  }) {
    return _then(_CookingState(
      recipe: recipe == freezed
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
      scale: scale == freezed
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      timers: timers == freezed
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CookingStatus,
      checkedList: checkedList == freezed
          ? _value.checkedList
          : checkedList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$_CookingState implements _CookingState {
  _$_CookingState(
      {required this.recipe,
      required this.scale,
      required this.startTime,
      required this.endTime,
      this.step = 0,
      this.timers = const <String, int>{},
      this.status = CookingStatus.prepare,
      this.checkedList = const <bool>[]});

  @override
  final Recipe recipe;
  @override
  final double scale;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @JsonKey()
  @override
  final int step;
  @JsonKey()
  @override
  final Map<String, int> timers;
  @JsonKey()
  @override
  final CookingStatus status;
  @JsonKey()
  @override
  final List<bool> checkedList;

  @override
  String toString() {
    return 'CookingState(recipe: $recipe, scale: $scale, startTime: $startTime, endTime: $endTime, step: $step, timers: $timers, status: $status, checkedList: $checkedList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CookingState &&
            const DeepCollectionEquality().equals(other.recipe, recipe) &&
            const DeepCollectionEquality().equals(other.scale, scale) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality().equals(other.step, step) &&
            const DeepCollectionEquality().equals(other.timers, timers) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.checkedList, checkedList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recipe),
      const DeepCollectionEquality().hash(scale),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(step),
      const DeepCollectionEquality().hash(timers),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(checkedList));

  @JsonKey(ignore: true)
  @override
  _$CookingStateCopyWith<_CookingState> get copyWith =>
      __$CookingStateCopyWithImpl<_CookingState>(this, _$identity);
}

abstract class _CookingState implements CookingState {
  factory _CookingState(
      {required Recipe recipe,
      required double scale,
      required DateTime startTime,
      required DateTime endTime,
      int step,
      Map<String, int> timers,
      CookingStatus status,
      List<bool> checkedList}) = _$_CookingState;

  @override
  Recipe get recipe;
  @override
  double get scale;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get step;
  @override
  Map<String, int> get timers;
  @override
  CookingStatus get status;
  @override
  List<bool> get checkedList;
  @override
  @JsonKey(ignore: true)
  _$CookingStateCopyWith<_CookingState> get copyWith =>
      throw _privateConstructorUsedError;
}
