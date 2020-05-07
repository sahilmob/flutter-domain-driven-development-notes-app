import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'failures.dart';
import 'package:ddd/domain/core/errors.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throes [UnexpectedValueError] containing [ValueFailure]
  T getOrCrach() {
// id =identity - same as writing (right) => right)
    return value.fold(
      (left) => throw UnexpectedValueError(left),
      id,
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
