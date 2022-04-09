import 'package:auto_route/auto_route.dart';
import 'package:friends_khata/admin/presentation/edit_members_page.dart';
import 'package:friends_khata/admin/presentation/transaction_page.dart';
import 'package:friends_khata/auth/presentation/pages/email_verification_page.dart';
import 'package:friends_khata/auth/presentation/pages/password_reset_page.dart';
import 'package:friends_khata/auth/presentation/pages/sign_in_page.dart';
import 'package:friends_khata/auth/presentation/pages/sign_up_page.dart';
import 'package:friends_khata/home/presentation/home_page.dart';
import 'package:friends_khata/home/presentation/khata_details_page.dart';
import 'package:friends_khata/home/presentation/transaction_history_page.dart';
import 'package:friends_khata/splash/presentation/splash_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: SignUpPage),
  MaterialRoute(page: PasswordResetPage),
  MaterialRoute(page: EmailVerificationPage),
  MaterialRoute(page: HomePage),
  MaterialRoute(page: KhataDetailsPage),
  MaterialRoute(page: TransactionHistoryPage),
  MaterialRoute(page: EditMembersPage),
  MaterialRoute(page: TransactionPage),
], replaceInRouteName: 'Page,Route')
class $AppRouter {}
