import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/logging/logger.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/navigation/routes.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/app/repositories/firestore_repository.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/pages/auth/bloc/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository, required this.firestoreRepository})
      : super(AuthState.initial);

  final AuthRepository authRepository;
  final FirestoreRepository firestoreRepository;

  Future<void> signUp() async {
    emit(state.copyWith(isLoading: true));
    try {
      final isUserNameBusy =
          await firestoreRepository.isUserNameBusy(userName: state.userName);
      if (isUserNameBusy) throw Exception(Strings.userNameIsBusy);
      await authRepository.signUp(
        email: state.email,
        password: state.password,
        userName: state.userName,
      );
      await authRepository.signInWithCredentials(state.email, state.password);
      emit(state.copyWith(isLoading: false));
      authenticate();
    } on FirebaseAuthException catch (e) {
      var message = e.message;
      if (e.code == 'email-already-in-use') message = Strings.emailAlreadyInUse;
      emit(state.copyWith(isLoading: false, errorMessage: message));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: Strings.unknownError,
        ),
      );
    }
  }

  void resetState() {
    emit(AuthState.initial);
  }

  void resetFormState() {
    emit(
      state.copyWith(
        email: '',
        userName: '',
        password: '',
        displayName: null,
        isLoading: false,
        errorMessage: null,
      ),
    );
  }

  void goToSignUpPage() {
    Navigation.instance.pushReplacement(SharedRoutes.signUp);
  }

  void goToSignInPage() {
    Navigation.instance.pushReplacement(SharedRoutes.signIn);
  }

  Future<void> googleSignIn() async {
    emit(state.copyWith(isLoading: true));
    try {
      await authRepository.signInWithGoogle();
      emit(state.copyWith(isLoading: false));
      authenticate();
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> signIn() async {
    emit(state.copyWith(isLoading: true));
    try {
      await authRepository.signInWithCredentials(state.email, state.password);
      emit(state.copyWith(isLoading: false));
      authenticate();
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.code,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void endSplash() {
    Navigation.instance
        .pushAndRemoveUntil(SharedRoutes.signIn, (route) => false);
  }

  void authenticate() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigation.instance.pushReplacement(SharedRoutes.check);
    } else {
      Navigation.instance.pushReplacement(SharedRoutes.home);
    }
  }

  Future<void> logout() async {
    await authRepository.signOut();
    Navigation.instance
        .pushAndRemoveUntil(SharedRoutes.check, (route) => false);
  }

  void tryAuthenticate() {
    try {
      if (authRepository.isSignedIn()) {
        emit(state.copyWith(displayName: authRepository.getUserName()));
        authenticate();
      } else {
        logout();
      }
    } catch (e) {
      Log.e(e);
    }
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void userNameChanged(String value) {
    emit(state.copyWith(userName: value));
  }
}
