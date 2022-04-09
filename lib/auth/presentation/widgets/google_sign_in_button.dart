import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:friends_khata/auth/presentation/widgets/elevated_icon_button.dart';
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
    return ElevatedIconButton(
      makeWhite: true,
      onPressed: ref.read(authNotifierProvider.notifier).signInWithGoogle,
      icon: const Icon(
        FontAwesomeIcons.google,
        size: 16,
      ),
      text: 'Sign in with Google',
    );
  }
}
