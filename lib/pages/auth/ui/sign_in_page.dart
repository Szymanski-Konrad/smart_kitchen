import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:smart_kitchen/app/repositories/auth_repository.dart';
import 'package:smart_kitchen/app/repositories/firestore_repository.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/pages/auth/bloc/auth_cubit.dart';
import 'package:smart_kitchen/pages/auth/bloc/auth_state.dart';
import 'package:smart_kitchen/utils/scoped_bloc_builder.dart';
import 'package:smart_kitchen/utils/ui/auth_text_field.dart';
import 'package:smart_kitchen/utils/ui/circular_progress.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
    final errorMessage = state.errorMessage;
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
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (errorMessage != null) Text(errorMessage),
              const SizedBox(height: 32),
              AuthTextField(
                initialValue: state.email,
                errorText: state.validateEmail || state.email.isEmpty
                    ? null
                    : Strings.emailValidationFail,
                onChanged: (email) => cubit.emailChanged(email),
                keyboardType: TextInputType.emailAddress,
                iconData: Icons.ac_unit,
                hintText: Strings.email,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                initialValue: state.password,
                obscureText: true,
                errorText: state.validatePassword || state.password.isEmpty
                    ? null
                    : Strings.shortPassword,
                onChanged: cubit.passwordChanged,
                iconData: Icons.lock,
                hintText: Strings.password,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: state.validateSignIn ? cubit.signIn : null,
                child: state.isLoading
                    ? const CircularProgress()
                    : const Text(Strings.signIn),
              ),
              const SizedBox(height: 16),
              SignInButton(
                Buttons.Google,
                onPressed: cubit.googleSignIn,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: cubit.goToSignUpPage,
                child: const Text(Strings.signUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
