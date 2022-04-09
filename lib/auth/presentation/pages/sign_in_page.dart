import 'package:auto_route/auto_route.dart';
import 'package:friends_khata/auth/application/auth_notifier.dart';
import 'package:friends_khata/auth/presentation/widgets/bottom_text_link.dart';
import 'package:friends_khata/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:friends_khata/auth/presentation/widgets/sign_in_form.dart';
import 'package:friends_khata/auth/shared/providers.dart';
import 'package:friends_khata/core/presentation/router/router.gr.dart';
import 'package:friends_khata/core/presentation/widgets/error_success_flash.dart';
import 'package:friends_khata/core/presentation/widgets/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(
      authNotifierProvider,
      (_, state) {
        state.maybeWhen(
          error: (failure) {
            failure.maybeWhen(
              noNetworkConnection: () =>
                  showErrorFlash(context, "No network connection"),
              tooManyRequests: () =>
                  showErrorFlash(context, "Too many requests"),
              userDisabled: () =>
                  showErrorFlash(context, "This account is disabled"),
              invalidEmailAndPasswordCombination: () => showErrorFlash(
                  context, "Invalid email and password combination"),
              unexpectedError: () =>
                  showErrorFlash(context, "An unexpected error occurred"),
              orElse: () {},
            );
          },
          orElse: () {},
        );
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoImage(),
                  const SizedBox(height: 30),
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 40),
                  const SignInForm(),
                  const GoogleSignInButton(),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () =>
                        context.pushRoute(const PasswordResetRoute()),
                    child: const Text(
                      'Forgot your password?',
                    ),
                  ),
                  BottomTextLink(
                    text: 'Don\'t have an account?',
                    link: 'Create one now.',
                    onPressed: () => context.pushRoute(const SignUpRoute()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
