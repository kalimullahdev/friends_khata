import 'package:friends_khata/auth/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInButton(
      Buttons.Google,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      onPressed: ref.read(authNotifierProvider.notifier).signInWithGoogle,
    );
  }
}
