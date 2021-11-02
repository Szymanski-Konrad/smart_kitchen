import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/app/repositories/firestore_repository.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/pages/auth/bloc/auth_cubit.dart';
import 'package:smart_kitchen/pages/auth/bloc/auth_state.dart';
import 'package:smart_kitchen/utils/scoped_bloc_builder.dart';
import 'package:smart_kitchen/utils/ui/auth_text_field.dart';
import 'package:smart_kitchen/utils/ui/circular_progress.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBlocBuilder<AuthCubit, AuthState>(
        create: (context) => AuthCubit(
          authRepository: AuthRepository(),
          firestoreRepository: FirestoreRepository(),
        ),
        builder: (context, state, cubit) =>
            _buildContent(context, cubit, state),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AuthCubit cubit,
    AuthState state,
  ) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.fastfood,
                size: 128,
              ),
              const SizedBox(height: 16),
              const Text(
                Strings.appTitle,
                textAlign: TextAlign.center,
              ),
              if (state.errorMessage != null)
                Text(
                  state.errorMessage ?? 'ERROR',
                  style: const TextStyle(
                    color: ColorPalette.errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 16),
              AuthTextField(
                initialValue: state.userName,
                errorText: state.validateUserName || state.userName.isEmpty
                    ? null
                    : Strings.shortUserName,
                onChanged: (value) => cubit.userNameChanged(value),
                iconData: Icons.person,
                hintText: Strings.userName,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                initialValue: state.email,
                errorText: state.validateEmail || state.email.isEmpty
                    ? null
                    : Strings.emailValidationFail,
                onChanged: (value) => cubit.emailChanged(value),
                keyboardType: TextInputType.emailAddress,
                iconData: Icons.email,
                hintText: Strings.email,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                initialValue: state.password,
                obscureText: true,
                errorText: state.validatePassword || state.password.isEmpty
                    ? null
                    : Strings.shortPassword,
                onChanged: (value) => cubit.passwordChanged(value),
                iconData: Icons.lock,
                hintText: Strings.password,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: state.validateSignUp ? cubit.signUp : null,
                child: state.isLoading
                    ? const CircularProgress()
                    : const Text(Strings.signUp),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: cubit.goToSignInPage,
                child: const Text(Strings.signIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
