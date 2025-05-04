//
//  Generated code. Do not modify.
//  source: Stellar.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// A predicate (used in claim)
/// Rest of predicates not currently supported
/// See https://github.com/stellar/stellar-protocol/blob/master/core/cap-0023.md
class ClaimPredicate extends $pb.ProtobufEnum {
  static const ClaimPredicate Predicate_unconditional = ClaimPredicate._(0, _omitEnumNames ? '' : 'Predicate_unconditional');

  static const $core.List<ClaimPredicate> values = <ClaimPredicate> [
    Predicate_unconditional,
  ];

  static final $core.Map<$core.int, ClaimPredicate> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClaimPredicate? valueOf($core.int value) => _byValue[value];

  const ClaimPredicate._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
