//
//  Generated code. Do not modify.
//  source: Polymesh.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SecondaryKeyPermissions_RestrictionKind extends $pb.ProtobufEnum {
  static const SecondaryKeyPermissions_RestrictionKind Whole = SecondaryKeyPermissions_RestrictionKind._(0, _omitEnumNames ? '' : 'Whole');
  static const SecondaryKeyPermissions_RestrictionKind These = SecondaryKeyPermissions_RestrictionKind._(1, _omitEnumNames ? '' : 'These');
  static const SecondaryKeyPermissions_RestrictionKind Except = SecondaryKeyPermissions_RestrictionKind._(2, _omitEnumNames ? '' : 'Except');

  static const $core.List<SecondaryKeyPermissions_RestrictionKind> values = <SecondaryKeyPermissions_RestrictionKind> [
    Whole,
    These,
    Except,
  ];

  static final $core.Map<$core.int, SecondaryKeyPermissions_RestrictionKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SecondaryKeyPermissions_RestrictionKind? valueOf($core.int value) => _byValue[value];

  const SecondaryKeyPermissions_RestrictionKind._(super.v, super.n);
}

class Utility_BatchKind extends $pb.ProtobufEnum {
  ///  Batch multiple calls, stoping on the first error.
  ///
  ///  Each call in the batch is executed in its own transaction.
  ///  When one call fails only that transaction will be rolled back
  ///  and any following calls in the batch will be skipped.
  static const Utility_BatchKind StopOnError = Utility_BatchKind._(0, _omitEnumNames ? '' : 'StopOnError');
  /// Batch multiple calls and execute them in a single atomic transaction.
  /// The whole transaction will rollback if any of the calls fail.
  static const Utility_BatchKind Atomic = Utility_BatchKind._(1, _omitEnumNames ? '' : 'Atomic');
  ///  Batch multiple calls.  Unlike `Batch` this will continue even
  ///  if one of the calls failed.
  ///
  ///  Each call in the batch is executed in its own transaction.
  ///  When a call fails its transaction will be rolled back and the error
  ///  will be emitted in an event.
  ///
  ///  Execution will continue until all calls in the batch have been executed.
  static const Utility_BatchKind Optimistic = Utility_BatchKind._(2, _omitEnumNames ? '' : 'Optimistic');

  static const $core.List<Utility_BatchKind> values = <Utility_BatchKind> [
    StopOnError,
    Atomic,
    Optimistic,
  ];

  static final $core.Map<$core.int, Utility_BatchKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Utility_BatchKind? valueOf($core.int value) => _byValue[value];

  const Utility_BatchKind._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
