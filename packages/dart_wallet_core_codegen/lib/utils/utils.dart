export 'any_signer.dart';
export 'defer.dart';
export 'extensions/address.dart';
export 'extensions/misc.dart';
export 'tw_data.dart';
export 'tw_string.dart';

// extension IntExtension on int {
//   Uint8List toByteArray() {
//     BigInt bigInt = BigInt.from(this);
//     // Get the bytes of the BigInt
//     List<int> bytes = bigInt.toRadixString(16).padLeft(2, '0').codeUnits;
//     // Convert hex string to byte array
//     return Uint8List.fromList(bytes
//         .map((e) => int.parse(String.fromCharCode(e), radix: 16))
//         .toList());
//   }

//   Uint8List get toBytes {
//     final hex = toRadixString(16);
//     return hex.hexToBytes();
//   }
// }
