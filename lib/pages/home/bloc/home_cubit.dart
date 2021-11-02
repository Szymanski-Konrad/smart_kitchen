import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/navigation/routes.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/pages/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.authRepository,
  }) : super(HomeState.initial);

  final AuthRepository authRepository;

  Future<void> logout() async {
    await authRepository.signOut();
    Navigation.instance
        .pushAndRemoveUntil(SharedRoutes.check, (route) => false);
  }

  void changePage(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
