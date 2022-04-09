import 'package:friends_khata/auth/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends_khata/core/presentation/router/router.gr.dart';
import 'package:friends_khata/home/domain/user.dart';
import 'package:friends_khata/home/infrastructure/home_repository.dart';
import 'package:friends_khata/home/presentation/khata_details_page.dart';
import 'package:friends_khata/home/shared/providers.dart';
import 'package:auto_route/auto_route.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Friends Khata"), actions: [
        TextButton(
          onPressed: ref.read(authNotifierProvider.notifier).signOut,
          child: const Text('Sign Out'),
        )
      ]),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            ListTile(
              title: const Text("Khata name"),
              subtitle: const Text("This is the Khata description"),
              onTap: () => context.pushRoute(const KhataDetailsRoute()),
            ),
            ListTile(
              title: Text("Khata name"),
              subtitle: Text("This is the Khata description"),
            ),
            ListTile(
              title: Text("Khata name"),
              subtitle: Text("This is the Khata description"),
            )
          ],
        ),
      ),
    );
  }
}

          // onPressed: () => ref
          //       .read(homeNotifierProvider.notifier)
          //       .addUser(name: "Kalim ullah", age: 21),