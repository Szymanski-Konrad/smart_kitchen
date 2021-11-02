import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/global_blocs/global_cubit_helper.dart';
import 'package:smart_kitchen/app/logging/logger.dart';

abstract class GlobalCubit<State> extends Cubit<State> {
  GlobalCubit(this.initialState) : super(initialState) {
    _addToGlobalCubitLists();
  }

  final State initialState;

  void _addToGlobalCubitLists() => GlobalCubitHelper.instance.addCubit(this);

  @mustCallSuper
  void clear() {
    Log.d('Cleared $this');
    emit(initialState);
  }

  @override
  @mustCallSuper
  Future<void> close() {
    return super.close();
  }
}
