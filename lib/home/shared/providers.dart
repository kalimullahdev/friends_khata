import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends_khata/home/application/home_notifier.dart';
import 'package:friends_khata/home/infrastructure/home_repository.dart';

final firebaseFirestoreProvider = Provider(
  (ref) => FirebaseFirestore.instance,
);

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(ref.watch(firebaseFirestoreProvider)),
);

final homeNotifierProvider = StateNotifierProvider(
  (ref) => HomeNotifier(ref.watch(homeRepositoryProvider)),
);
