import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_failures.freezed.dart';

@freezed
class HomeFailures with _$HomeFailures {
  const HomeFailures._();
  const factory HomeFailures.unexpected() = _Unexpected;
  const factory HomeFailures.unableToAddUser() = _UnableToAddUser;
}
