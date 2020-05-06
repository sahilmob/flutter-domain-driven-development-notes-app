import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';

import 'package:ddd/domain/auth/auth_failure.dart';

import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) {}

  Future<Either<AuthFailure, Unit>> signinWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) {}

  Future<Either<AuthFailure, Unit>> signinWithGoogle() {}
}
