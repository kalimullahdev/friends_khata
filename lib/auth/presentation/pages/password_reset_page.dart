import 'package:friends_khata/auth/application/password_reset_notifier.dart';
import 'package:friends_khata/auth/presentation/widgets/password_reset_form.dart';
import 'package:friends_khata/auth/shared/providers.dart';
import 'package:friends_khata/core/presentation/widgets/error_success_flash.dart';
import 'package:friends_khata/core/presentation/widgets/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class PasswordResetPage extends ConsumerWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<PasswordResetState>(
      passwordResetNotifierProvider,
      (_, state) {
        state.maybeWhen(
          submitted: () {
            showSuccessFlash(context, "Reset email send");
            context.popRoute();
          },
          error: (failure) => failure.maybeWhen(
            emailDoestNotExist: () =>
                showErrorFlash(context, "Email doest not exists"),
            noNetworkConnection: () =>
                showErrorFlash(context, "No network connection"),
            tooManyRequests: () => showErrorFlash(context, "Too many request"),
            unexpectedError: () =>
                showErrorFlash(context, "An unexpected error occurred"),
            orElse: () {},
          ),
          orElse: () {},
        );
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoImage(),
                  const SizedBox(height: 20),
                  Text(
                    'Reset Your Password',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const PasswordResetForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
