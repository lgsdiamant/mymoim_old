import 'package:freezed_annotation/freezed_annotation.dart';

part 'mo_member.freezed.dart';

/// for Member

@freezed
class MoMember with _$MoMember {
  factory MoMember({required int uuid , required String phoneNumber}) = _Member;
}