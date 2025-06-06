//
//  Generated code. Do not modify.
//  source: Solana.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TokenProgramId extends $pb.ProtobufEnum {
  static const TokenProgramId TokenProgram = TokenProgramId._(0, _omitEnumNames ? '' : 'TokenProgram');
  static const TokenProgramId Token2022Program = TokenProgramId._(1, _omitEnumNames ? '' : 'Token2022Program');

  static const $core.List<TokenProgramId> values = <TokenProgramId> [
    TokenProgram,
    Token2022Program,
  ];

  static final $core.Map<$core.int, TokenProgramId> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TokenProgramId? valueOf($core.int value) => _byValue[value];

  const TokenProgramId._(super.v, super.n);
}

class Encoding extends $pb.ProtobufEnum {
  static const Encoding Base58 = Encoding._(0, _omitEnumNames ? '' : 'Base58');
  static const Encoding Base64 = Encoding._(1, _omitEnumNames ? '' : 'Base64');

  static const $core.List<Encoding> values = <Encoding> [
    Base58,
    Base64,
  ];

  static final $core.Map<$core.int, Encoding> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Encoding? valueOf($core.int value) => _byValue[value];

  const Encoding._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
