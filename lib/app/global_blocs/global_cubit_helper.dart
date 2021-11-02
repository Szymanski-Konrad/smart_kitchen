import 'package:flutter/foundation.dart';
import 'package:smart_kitchen/app/global_blocs/global_cubit.dart';
import 'package:smart_kitchen/app/logging/logger.dart';

@immutable
class GlobalCubitHelper {
  static final GlobalCubitHelper instance = GlobalCubitHelper();

  final List<GlobalCubit> _cubits = [];

  void addCubit(GlobalCubit cubit) => _cubits.add(cubit);

  void clearAll() {
    for (final cubit in _cubits) {
      _clear(cubit);
    }
  }

  void _clear(GlobalCubit cubit) {
    try {
      cubit.clear();
    } catch (e) {
      Log.e(e);
    }
  }
}
