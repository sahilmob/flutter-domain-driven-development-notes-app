// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ValueFailure<T> {
  String get filedValue;

  ValueFailure<T> copyWith({String filedValue});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invaliedEmail(@required String filedValue),
    @required Result shortPassword(@required String filedValue),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invaliedEmail(@required String filedValue),
    Result shortPassword(@required String filedValue),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invaliedEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invaliedEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    @required Result orElse(),
  });
}

class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidEmail<T> invaliedEmail<T>({@required String filedValue}) {
    return InvalidEmail<T>(
      filedValue: filedValue,
    );
  }

  ShortPassword<T> shortPassword<T>({@required String filedValue}) {
    return ShortPassword<T>(
      filedValue: filedValue,
    );
  }
}

const $ValueFailure = _$ValueFailureTearOff();

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({@required this.filedValue})
      : assert(filedValue != null);

  @override
  final String filedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invaliedEmail(filedValue: $filedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail<T> &&
            (identical(other.filedValue, filedValue) ||
                const DeepCollectionEquality()
                    .equals(other.filedValue, filedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filedValue);

  @override
  _$InvalidEmail<T> copyWith({
    Object filedValue = freezed,
  }) {
    return _$InvalidEmail<T>(
      filedValue:
          filedValue == freezed ? this.filedValue : filedValue as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invaliedEmail(@required String filedValue),
    @required Result shortPassword(@required String filedValue),
  }) {
    assert(invaliedEmail != null);
    assert(shortPassword != null);
    return invaliedEmail(filedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invaliedEmail(@required String filedValue),
    Result shortPassword(@required String filedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invaliedEmail != null) {
      return invaliedEmail(filedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invaliedEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
  }) {
    assert(invaliedEmail != null);
    assert(shortPassword != null);
    return invaliedEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invaliedEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invaliedEmail != null) {
      return invaliedEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({@required String filedValue}) = _$InvalidEmail<T>;

  @override
  String get filedValue;

  @override
  InvalidEmail<T> copyWith({String filedValue});
}

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({@required this.filedValue})
      : assert(filedValue != null);

  @override
  final String filedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortPassword(filedValue: $filedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShortPassword<T> &&
            (identical(other.filedValue, filedValue) ||
                const DeepCollectionEquality()
                    .equals(other.filedValue, filedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filedValue);

  @override
  _$ShortPassword<T> copyWith({
    Object filedValue = freezed,
  }) {
    return _$ShortPassword<T>(
      filedValue:
          filedValue == freezed ? this.filedValue : filedValue as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invaliedEmail(@required String filedValue),
    @required Result shortPassword(@required String filedValue),
  }) {
    assert(invaliedEmail != null);
    assert(shortPassword != null);
    return shortPassword(filedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invaliedEmail(@required String filedValue),
    Result shortPassword(@required String filedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(filedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invaliedEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
  }) {
    assert(invaliedEmail != null);
    assert(shortPassword != null);
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invaliedEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({@required String filedValue}) =
      _$ShortPassword<T>;

  @override
  String get filedValue;

  @override
  ShortPassword<T> copyWith({String filedValue});
}
