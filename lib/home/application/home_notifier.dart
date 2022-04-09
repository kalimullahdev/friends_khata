import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friends_khata/home/domain/home_failures.dart';
import 'package:friends_khata/home/domain/user.dart';
import 'package:friends_khata/home/infrastructure/home_repository.dart';
part 'home_notifier.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState.initial() = _Initial;
  const factory HomeState.success() = _Success;
  const factory HomeState.error(HomeFailures failures) = _Error;
}

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepository _homeRepository;
  HomeNotifier(this._homeRepository) : super(const HomeState.initial());
  Future<void> addUser({required String name, required int age}) async {
    final failureOrSuccess =
        await _homeRepository.addUser(User(name: name, age: age));

    failureOrSuccess.fold((failure) => state = HomeState.error(failure),
        (r) => state = const HomeState.success());
  }
}
