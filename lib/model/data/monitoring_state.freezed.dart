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
    required TResult Function(int battery, String? msg) monitoring,
    required TResult Function(String? msg) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int battery, String? msg)? monitoring,
    TResult? Function(String? msg)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int battery, String? msg)? monitoring,
    TResult Function(String? msg)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Monitoring value) monitoring,
    required TResult Function(Idle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Monitoring value)? monitoring,
    TResult? Function(Idle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Monitoring value)? monitoring,
    TResult Function(Idle value)? idle,
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
  $Res call({String? msg});
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
    Object? msg = freezed,
  }) {
    return _then(_value.copyWith(
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitoringCopyWith<$Res>
    implements $MonitoringStateCopyWith<$Res> {
  factory _$$MonitoringCopyWith(
          _$Monitoring value, $Res Function(_$Monitoring) then) =
      __$$MonitoringCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int battery, String? msg});
}

/// @nodoc
class __$$MonitoringCopyWithImpl<$Res>
    extends _$MonitoringStateCopyWithImpl<$Res, _$Monitoring>
    implements _$$MonitoringCopyWith<$Res> {
  __$$MonitoringCopyWithImpl(
      _$Monitoring _value, $Res Function(_$Monitoring) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battery = null,
    Object? msg = freezed,
  }) {
    return _then(_$Monitoring(
      null == battery
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Monitoring implements Monitoring {
  const _$Monitoring(this.battery, [this.msg]);

  @override
  final int battery;
  @override
  final String? msg;

  @override
  String toString() {
    return 'MonitoringState.monitoring(battery: $battery, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Monitoring &&
            (identical(other.battery, battery) || other.battery == battery) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, battery, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringCopyWith<_$Monitoring> get copyWith =>
      __$$MonitoringCopyWithImpl<_$Monitoring>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int battery, String? msg) monitoring,
    required TResult Function(String? msg) idle,
  }) {
    return monitoring(battery, msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int battery, String? msg)? monitoring,
    TResult? Function(String? msg)? idle,
  }) {
    return monitoring?.call(battery, msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int battery, String? msg)? monitoring,
    TResult Function(String? msg)? idle,
    required TResult orElse(),
  }) {
    if (monitoring != null) {
      return monitoring(battery, msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Monitoring value) monitoring,
    required TResult Function(Idle value) idle,
  }) {
    return monitoring(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Monitoring value)? monitoring,
    TResult? Function(Idle value)? idle,
  }) {
    return monitoring?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Monitoring value)? monitoring,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (monitoring != null) {
      return monitoring(this);
    }
    return orElse();
  }
}

abstract class Monitoring implements MonitoringState {
  const factory Monitoring(final int battery, [final String? msg]) =
      _$Monitoring;

  int get battery;
  @override
  String? get msg;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringCopyWith<_$Monitoring> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IdleCopyWith<$Res> implements $MonitoringStateCopyWith<$Res> {
  factory _$$IdleCopyWith(_$Idle value, $Res Function(_$Idle) then) =
      __$$IdleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? msg});
}

/// @nodoc
class __$$IdleCopyWithImpl<$Res>
    extends _$MonitoringStateCopyWithImpl<$Res, _$Idle>
    implements _$$IdleCopyWith<$Res> {
  __$$IdleCopyWithImpl(_$Idle _value, $Res Function(_$Idle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_$Idle(
      freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle([this.msg]);

  @override
  final String? msg;

  @override
  String toString() {
    return 'MonitoringState.idle(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Idle &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleCopyWith<_$Idle> get copyWith =>
      __$$IdleCopyWithImpl<_$Idle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int battery, String? msg) monitoring,
    required TResult Function(String? msg) idle,
  }) {
    return idle(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int battery, String? msg)? monitoring,
    TResult? Function(String? msg)? idle,
  }) {
    return idle?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int battery, String? msg)? monitoring,
    TResult Function(String? msg)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Monitoring value) monitoring,
    required TResult Function(Idle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Monitoring value)? monitoring,
    TResult? Function(Idle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Monitoring value)? monitoring,
    TResult Function(Idle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements MonitoringState {
  const factory Idle([final String? msg]) = _$Idle;

  @override
  String? get msg;
  @override
  @JsonKey(ignore: true)
  _$$IdleCopyWith<_$Idle> get copyWith => throw _privateConstructorUsedError;
}
