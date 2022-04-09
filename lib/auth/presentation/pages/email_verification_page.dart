import 'package:friends_khata/auth/application/email_verification_notifier.dart';
import 'package:friends_khata/auth/presentation/widgets/bottom_text_link.dart';
import 'package:friends_khata/auth/shared/providers.dart';
import 'package:friends_khata/core/presentation/router/router.gr.dart';
import 'package:friends_khata/core/presentation/widgets/error_success_flash.dart';
import 'package:friends_khata/core/presentation/widgets/logo_image.dart';
import 'package:friends_khata/home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class EmailVerificationPage extends ConsumerWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<EmailVerificationState>(
      emailVerificationNotifierProvider,
      (_, state) {
        state.maybeWhen(
          submitted: () => showSuccessFlash(context, "Verification email sent"),
          error: (failure) => failure.maybeWhen(
            noNetworkConnection: () =>
                showErrorFlash(context, "No network connection"),
            tooManyRequests: () => showErrorFlash(context, "Too many request"),
            userDisabled: () => showErrorFlash(context, "User is disabled"),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoImage(),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Please verify your email',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 20),
                const Text(
                  'We\'ve sent you an email, click on the email link to verify your account.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Already verified your email? Continue to your account.',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final isVerified = await ref
                        .read(emailVerificationNotifierProvider.notifier)
                        .isEmailVerified();

                    isVerified
                        ? context.router.replace(const HomeRoute())
                        : showErrorFlash(context, "Email is not verified");
                  },
                  child: const Center(
                    child: Text('Continue'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BottomTextLink(
                  text: 'Still don\'t see the email?',
                  link: 'Resend email.',
                  onPressed: ref
                      .read(emailVerificationNotifierProvider.notifier)
                      .resendVerificationEmail,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
