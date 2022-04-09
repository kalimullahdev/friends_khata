import 'package:friends_khata/auth/application/auth_notifier.dart';
import 'package:friends_khata/auth/shared/providers.dart';
import 'package:friends_khata/core/presentation/router/router.gr.dart';
import 'package:friends_khata/core/presentation/theming/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppWidget extends ConsumerWidget {
  AppWidget({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authNotifierProvider, (_, state) {
      state.maybeWhen(
        authenticated: () async {
          final isEmailVerified = await ref
              .read(emailVerificationNotifierProvider.notifier)
              .isEmailVerified();
          if (!isEmailVerified) {
            _appRouter.pushAndPopUntil(
              const EmailVerificationRoute(),
              predicate: (_) => false,
            );
          } else {
            _appRouter.pushAndPopUntil(
              const HomeRoute(),
              predicate: (_) => false,
            );
          }
        },
        unauthenticated: () {
          _appRouter.pushAndPopUntil(
            const SignInRoute(),
            predicate: (_) => false,
          );
        },
        orElse: () {},
      );
    });
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // theme: CustomTheme.appTheme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
