// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mo_enclave.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoEnclave {
  int get uuid => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoEnclaveCopyWith<MoEnclave> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoEnclaveCopyWith<$Res> {
  factory $MoEnclaveCopyWith(MoEnclave value, $Res Function(MoEnclave) then) =
      _$MoEnclaveCopyWithImpl<$Res, MoEnclave>;
  @useResult
  $Res call({int uuid, String phoneNumber});
}

/// @nodoc
class _$MoEnclaveCopyWithImpl<$Res, $Val extends MoEnclave>
    implements $MoEnclaveCopyWith<$Res> {
  _$MoEnclaveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoEnclaveCopyWith<$Res> implements $MoEnclaveCopyWith<$Res> {
  factory _$$_MoEnclaveCopyWith(
          _$_MoEnclave value, $Res Function(_$_MoEnclave) then) =
      __$$_MoEnclaveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int uuid, String phoneNumber});
}

/// @nodoc
class __$$_MoEnclaveCopyWithImpl<$Res>
    extends _$MoEnclaveCopyWithImpl<$Res, _$_MoEnclave>
    implements _$$_MoEnclaveCopyWith<$Res> {
  __$$_MoEnclaveCopyWithImpl(
      _$_MoEnclave _value, $Res Function(_$_MoEnclave) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$_MoEnclave(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MoEnclave implements _MoEnclave {
  _$_MoEnclave({required this.uuid, required this.phoneNumber});

  @override
  final int uuid;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'MoEnclave(uuid: $uuid, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoEnclave &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoEnclaveCopyWith<_$_MoEnclave> get copyWith =>
      __$$_MoEnclaveCopyWithImpl<_$_MoEnclave>(this, _$identity);
}

abstract class _MoEnclave implements MoEnclave {
  factory _MoEnclave(
      {required final int uuid,
      required final String phoneNumber}) = _$_MoEnclave;

  @override
  int get uuid;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_MoEnclaveCopyWith<_$_MoEnclave> get copyWith =>
      throw _privateConstructorUsedError;
}
