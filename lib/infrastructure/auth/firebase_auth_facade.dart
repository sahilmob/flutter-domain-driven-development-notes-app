import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:google_sign_in/google_sign_in.dart";

import 'package:ddd/domain/auth/auth_failure.dart';
import 'package:ddd/domain/auth/value_objects.dart';
import 'package:ddd/domain/auth/i_auth_facade.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@RegisterAs(IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSingIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSingIn);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    final emailAddressString = emailAddress.getOrCrach();
    final passwordString = password.getOrCrach();

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      return right(unit);
    } on PlatformException catch (error) {
      if (error.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        return left(
          const AuthFailure.emailAlreadyInUse(),
        );
      } else {
        return left(
          const AuthFailure.serverError(),
        );
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signinWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    final emailAddressString = emailAddress.getOrCrach();
    final passwordString = password.getOrCrach();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      return right(unit);
    } on PlatformException catch (error) {
      if (error.code == "ERROR_WRONG_PASSWORD" ||
          error.code == "ERROR_USER_NOT_FOUND") {
        return left(
          const AuthFailure.invalidEmailAndPasswordCombination(),
        );
      } else {
        return left(
          const AuthFailure.serverError(),
        );
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signinWithGoogle() async {
    try {
      final googleUser = await _googleSingIn.signIn();

      if (googleUser == null) {
        return left(
          const AuthFailure.cancelledByUser(),
        );
      }

      final googleAuthentication = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.getCredential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      await _firebaseAuth.signInWithCredential(
        authCredential,
      );
      return right(unit);
    } catch (error) {
      print(error);
      return left(
        const AuthFailure.serverError(),
      );
    }
  }
}
