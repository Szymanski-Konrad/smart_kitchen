import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_kitchen/utils/validators.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    String? displayName,
    required bool isLoading,
    required String userName,
    required String email,
    required String password,
    String? errorMessage,
  }) = _AuthState;

  static AuthState get initial => const AuthState(
        isLoading: false,
        email: '',
        password: '',
        userName: '',
      );
}

extension AuthStateExtension on AuthState {
  bool get validateUserName => userName.length > 3;
  bool get validatePassword => Validators.isValidPassword(password);
  bool get validateEmail => Validators.isValidEmail(email);

  bool get validateSignIn => validateEmail && validatePassword;
  bool get validateSignUp =>
      validateUserName && validateEmail && validatePassword;
}
