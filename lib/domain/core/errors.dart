import 'package:ddd/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explaination =
        "Encountred a ValueFailure at an unrecoverable point. Terminating.";
    return Error.safeToString("$explaination Failure was $valueFailure");
  }
}
