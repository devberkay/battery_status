// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoring_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MonitoringState {
  String? get msg => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double battery, String? msg) success,
    required TResult Function(String msg) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double battery, String? msg)? success,
    TResult? Function(String msg)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double battery, String? msg)? success,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonitoringStateCopyWith<MonitoringState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringStateCopyWith<$Res> {
  factory $MonitoringStateCopyWith(
          MonitoringState value, $Res Function(MonitoringState) then) =
      _$MonitoringStateCopyWithImpl<$Res, MonitoringState>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class _$MonitoringStateCopyWithImpl<$Res, $Val extends MonitoringState>
    implements $MonitoringStateCopyWith<$Res> {
  _$MonitoringStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_value.copyWith(
      msg: null == msg
          ? _value.msg!
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuccessCopyWith<$Res>
    implements $MonitoringStateCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double battery, String? msg});
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$MonitoringStateCopyWithImpl<$Res, _$Success>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battery = null,
    Object? msg = freezed,
  }) {
    return _then(_$Success(
      null == battery
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as double,
      freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  const _$Success(this.battery, [this.msg]);

  @override
  final double battery;
  @override
  final String? msg;

  @override
  String toString() {
    return 'MonitoringState.success(battery: $battery, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success &&
            (identical(other.battery, battery) || other.battery == battery) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, battery, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCopyWith<_$Success> get copyWith =>
      __$$SuccessCopyWithImpl<_$Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double battery, String? msg) success,
    required TResult Function(String msg) fail,
  }) {
    return success(battery, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double battery, String? msg)? success,
    TResult? Function(String msg)? fail,
  }) {
    return success?.call(battery, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double battery, String? msg)? success,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(battery, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements MonitoringState {
  const factory Success(final double battery, [final String? msg]) = _$Success;

  double get battery;
  @override
  String? get msg;
  @override
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<_$Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailCopyWith<$Res> implements $MonitoringStateCopyWith<$Res> {
  factory _$$FailCopyWith(_$Fail value, $Res Function(_$Fail) then) =
      __$$FailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$FailCopyWithImpl<$Res>
    extends _$MonitoringStateCopyWithImpl<$Res, _$Fail>
    implements _$$FailCopyWith<$Res> {
  __$$FailCopyWithImpl(_$Fail _value, $Res Function(_$Fail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$Fail(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Fail implements Fail {
  const _$Fail(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'MonitoringState.fail(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Fail &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailCopyWith<_$Fail> get copyWith =>
      __$$FailCopyWithImpl<_$Fail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double battery, String? msg) success,
    required TResult Function(String msg) fail,
  }) {
    return fail(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double battery, String? msg)? success,
    TResult? Function(String msg)? fail,
  }) {
    return fail?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double battery, String? msg)? success,
    TResult Function(String msg)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class Fail implements MonitoringState {
  const factory Fail(final String msg) = _$Fail;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$FailCopyWith<_$Fail> get copyWith => throw _privateConstructorUsedError;
}
