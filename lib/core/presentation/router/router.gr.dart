// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../../admin/presentation/edit_members_page.dart' as _i9;
import '../../../admin/presentation/transaction_page.dart' as _i10;
import '../../../auth/presentation/pages/email_verification_page.dart' as _i5;
import '../../../auth/presentation/pages/password_reset_page.dart' as _i4;
import '../../../auth/presentation/pages/sign_in_page.dart' as _i2;
import '../../../auth/presentation/pages/sign_up_page.dart' as _i3;
import '../../../home/presentation/home_page.dart' as _i6;
import '../../../home/presentation/khata_details_page.dart' as _i7;
import '../../../home/presentation/transaction_history_page.dart' as _i8;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignUpPage());
    },
    PasswordResetRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PasswordResetPage());
    },
    EmailVerificationRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmailVerificationPage());
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomePage());
    },
    KhataDetailsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.KhataDetailsPage());
    },
    TransactionHistoryRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.TransactionHistoryPage());
    },
    EditMembersRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EditMembersPage());
    },
    TransactionRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.TransactionPage());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(SplashRoute.name, path: '/'),
        _i11.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i11.RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        _i11.RouteConfig(PasswordResetRoute.name, path: '/password-reset-page'),
        _i11.RouteConfig(EmailVerificationRoute.name,
            path: '/email-verification-page'),
        _i11.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i11.RouteConfig(KhataDetailsRoute.name, path: '/khata-details-page'),
        _i11.RouteConfig(TransactionHistoryRoute.name,
            path: '/transaction-history-page'),
        _i11.RouteConfig(EditMembersRoute.name, path: '/edit-members-page'),
        _i11.RouteConfig(TransactionRoute.name, path: '/transaction-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.PasswordResetPage]
class PasswordResetRoute extends _i11.PageRouteInfo<void> {
  const PasswordResetRoute()
      : super(PasswordResetRoute.name, path: '/password-reset-page');

  static const String name = 'PasswordResetRoute';
}

/// generated route for
/// [_i5.EmailVerificationPage]
class EmailVerificationRoute extends _i11.PageRouteInfo<void> {
  const EmailVerificationRoute()
      : super(EmailVerificationRoute.name, path: '/email-verification-page');

  static const String name = 'EmailVerificationRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.KhataDetailsPage]
class KhataDetailsRoute extends _i11.PageRouteInfo<void> {
  const KhataDetailsRoute()
      : super(KhataDetailsRoute.name, path: '/khata-details-page');

  static const String name = 'KhataDetailsRoute';
}

/// generated route for
/// [_i8.TransactionHistoryPage]
class TransactionHistoryRoute extends _i11.PageRouteInfo<void> {
  const TransactionHistoryRoute()
      : super(TransactionHistoryRoute.name, path: '/transaction-history-page');

  static const String name = 'TransactionHistoryRoute';
}

/// generated route for
/// [_i9.EditMembersPage]
class EditMembersRoute extends _i11.PageRouteInfo<void> {
  const EditMembersRoute()
      : super(EditMembersRoute.name, path: '/edit-members-page');

  static const String name = 'EditMembersRoute';
}

/// generated route for
/// [_i10.TransactionPage]
class TransactionRoute extends _i11.PageRouteInfo<void> {
  const TransactionRoute()
      : super(TransactionRoute.name, path: '/transaction-page');

  static const String name = 'TransactionRoute';
}
