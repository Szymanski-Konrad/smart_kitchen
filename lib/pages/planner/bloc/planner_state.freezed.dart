// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'planner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlannerStateTearOff {
  const _$PlannerStateTearOff();

  _PlannerState call(
      {required DateTime selectedDate,
      bool isLoading = false,
      bool isGenerating = false,
      List<DateTime> markedDays = const <DateTime>[],
      required PlannerDay day}) {
    return _PlannerState(
      selectedDate: selectedDate,
      isLoading: isLoading,
      isGenerating: isGenerating,
      markedDays: markedDays,
      day: day,
    );
  }
}

/// @nodoc
const $PlannerState = _$PlannerStateTearOff();

/// @nodoc
mixin _$PlannerState {
  DateTime get selectedDate => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isGenerating => throw _privateConstructorUsedError;
  List<DateTime> get markedDays => throw _privateConstructorUsedError;
  PlannerDay get day => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlannerStateCopyWith<PlannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlannerStateCopyWith<$Res> {
  factory $PlannerStateCopyWith(
          PlannerState value, $Res Function(PlannerState) then) =
      _$PlannerStateCopyWithImpl<$Res>;
  $Res call(
      {DateTime selectedDate,
      bool isLoading,
      bool isGenerating,
      List<DateTime> markedDays,
      PlannerDay day});

  $PlannerDayCopyWith<$Res> get day;
}

/// @nodoc
class _$PlannerStateCopyWithImpl<$Res> implements $PlannerStateCopyWith<$Res> {
  _$PlannerStateCopyWithImpl(this._value, this._then);

  final PlannerState _value;
  // ignore: unused_field
  final $Res Function(PlannerState) _then;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? isLoading = freezed,
    Object? isGenerating = freezed,
    Object? markedDays = freezed,
    Object? day = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGenerating: isGenerating == freezed
          ? _value.isGenerating
          : isGenerating // ignore: cast_nullable_to_non_nullable
              as bool,
      markedDays: markedDays == freezed
          ? _value.markedDays
          : markedDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as PlannerDay,
    ));
  }

  @override
  $PlannerDayCopyWith<$Res> get day {
    return $PlannerDayCopyWith<$Res>(_value.day, (value) {
      return _then(_value.copyWith(day: value));
    });
  }
}

/// @nodoc
abstract class _$PlannerStateCopyWith<$Res>
    implements $PlannerStateCopyWith<$Res> {
  factory _$PlannerStateCopyWith(
          _PlannerState value, $Res Function(_PlannerState) then) =
      __$PlannerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime selectedDate,
      bool isLoading,
      bool isGenerating,
      List<DateTime> markedDays,
      PlannerDay day});

  @override
  $PlannerDayCopyWith<$Res> get day;
}

/// @nodoc
class __$PlannerStateCopyWithImpl<$Res> extends _$PlannerStateCopyWithImpl<$Res>
    implements _$PlannerStateCopyWith<$Res> {
  __$PlannerStateCopyWithImpl(
      _PlannerState _value, $Res Function(_PlannerState) _then)
      : super(_value, (v) => _then(v as _PlannerState));

  @override
  _PlannerState get _value => super._value as _PlannerState;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? isLoading = freezed,
    Object? isGenerating = freezed,
    Object? markedDays = freezed,
    Object? day = freezed,
  }) {
    return _then(_PlannerState(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGenerating: isGenerating == freezed
          ? _value.isGenerating
          : isGenerating // ignore: cast_nullable_to_non_nullable
              as bool,
      markedDays: markedDays == freezed
          ? _value.markedDays
          : markedDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as PlannerDay,
    ));
  }
}

/// @nodoc

class _$_PlannerState implements _PlannerState {
  _$_PlannerState(
      {required this.selectedDate,
      this.isLoading = false,
      this.isGenerating = false,
      this.markedDays = const <DateTime>[],
      required this.day});

  @override
  final DateTime selectedDate;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isGenerating;
  @JsonKey()
  @override
  final List<DateTime> markedDays;
  @override
  final PlannerDay day;

  @override
  String toString() {
    return 'PlannerState(selectedDate: $selectedDate, isLoading: $isLoading, isGenerating: $isGenerating, markedDays: $markedDays, day: $day)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlannerState &&
            const DeepCollectionEquality()
                .equals(other.selectedDate, selectedDate) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isGenerating, isGenerating) &&
            const DeepCollectionEquality()
                .equals(other.markedDays, markedDays) &&
            const DeepCollectionEquality().equals(other.day, day));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedDate),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isGenerating),
      const DeepCollectionEquality().hash(markedDays),
      const DeepCollectionEquality().hash(day));

  @JsonKey(ignore: true)
  @override
  _$PlannerStateCopyWith<_PlannerState> get copyWith =>
      __$PlannerStateCopyWithImpl<_PlannerState>(this, _$identity);
}

abstract class _PlannerState implements PlannerState {
  factory _PlannerState(
      {required DateTime selectedDate,
      bool isLoading,
      bool isGenerating,
      List<DateTime> markedDays,
      required PlannerDay day}) = _$_PlannerState;

  @override
  DateTime get selectedDate;
  @override
  bool get isLoading;
  @override
  bool get isGenerating;
  @override
  List<DateTime> get markedDays;
  @override
  PlannerDay get day;
  @override
  @JsonKey(ignore: true)
  _$PlannerStateCopyWith<_PlannerState> get copyWith =>
      throw _privateConstructorUsedError;
}
