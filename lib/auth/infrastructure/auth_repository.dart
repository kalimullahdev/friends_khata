import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:friends_khata/auth/domain/auth_failure.dart';
import 'package:friends_khata/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(this._firebaseAuth, this._googleSignIn);

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  User? get _currentUser => _firebaseAuth.currentUser;
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final crendials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await crendials.user!.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == "email-already-in-use") {
        return left(const AuthFailure.emailInUsee());
      } else if (error == "network-request-failed") {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == "too-many-requests") {
        return left(const AuthFailure.tooManyRequests());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  Future<Either<AuthFailure, Unit>> signInWithEmailOrPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == "user-disabled") {
        return left(const AuthFailure.userDisabled());
      } else if (error == "network-request-failed") {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == "too-many-requests") {
        return left(const AuthFailure.tooManyRequests());
      } else if (error == "user-not-found" || error == "wrong-password") {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final signInAccount = await _googleSignIn.signIn();

      if (signInAccount != null) {
        final authentication = await signInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: authentication.accessToken,
            idToken: authentication.idToken);
        await _firebaseAuth.signInWithCredential(credential);
        return right(unit);
      }
      return left(const AuthFailure.cancelledByUser());
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == "user-disabled") {
        return left(const AuthFailure.userDisabled());
      } else if (error == "network-request-failed") {
        return left(const AuthFailure.noNetworkConnection());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  Future<Either<AuthFailure, bool>> isUserEmailVerified() async {
    try {
      await _currentUser!.reload();
      return right(_currentUser!.emailVerified);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == "network-request-failed") {
        return left(const AuthFailure.noNetworkConnection());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  Future<Either<AuthFailure, Unit>> resendVerificationEmail() async {
    try {
      await _currentUser!.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == "network-request-failed") {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == "too-many-requests") {
        return left(const AuthFailure.tooManyRequests());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == "network-request-failed") {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == "too-many-requests") {
        return left(const AuthFailure.tooManyRequests());
      } else if (error == "user-not-found") {
        return left(const AuthFailure.emailDoestNotExist());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }
}
