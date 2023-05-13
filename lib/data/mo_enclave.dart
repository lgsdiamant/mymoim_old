import 'package:freezed_annotation/freezed_annotation.dart';

part 'mo_enclave.freezed.dart';

/// for Member

@freezed
class MoEnclave with _$MoEnclave {
  factory MoEnclave({required int uuid , required String phoneNumber}) = _MoEnclave;
}