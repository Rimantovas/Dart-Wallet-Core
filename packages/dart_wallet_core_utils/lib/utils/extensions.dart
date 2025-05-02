import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

const String _base58Alphabet =
    '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';

/// Extension on [List<int>] to convert to [Uint8List] and get hex string.
extension ListIntToHexString on List<int> {
  /// Converts the list to a [Uint8List].
  Uint8List get toUint8List => Uint8List.fromList(this);

  /// Returns the hex string representation of the list.
  String get hexString {
    return map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }

  /// Converts the list to a [Pointer<Uint8>].
  Pointer<Uint8> toPointerUint8() {
    final blob = calloc<Uint8>(length);
    final blobBytes = blob.asTypedList(length);
    blobBytes.setAll(0, this);
    return blob;
  }

  /// Encodes the list to a base58 string.
  String toBase58() => base58encode(toList(growable: false));

  /// Encodes the list to a base58 string.
  String base58encode(List<int> bytes) {
    String encoded = '';
    if (bytes.isEmpty) return encoded;
    final zeroes = bytes.takeWhile((v) => v == 0).length;
    int length = 0;
    final size = (bytes.length - zeroes) * 138 ~/ 100 + 1;
    final List<int> b58bytes = List<int>.filled(size, 0);
    for (final byteValue in bytes.skip(zeroes)) {
      int carry = byteValue;
      int i = 0;
      for (int j = 0; j < size; j++, i++) {
        // ignore: avoid-inverted-boolean-checks, fix later
        if (!((carry != 0) || (i < length))) break;
        carry += 256 * b58bytes[j];
        b58bytes[j] = carry % 58;
        carry ~/= 58;
      }
      length = i;
    }
    final List<int> finalBytes = b58bytes.sublist(0, length);
    for (final byte in finalBytes) {
      encoded = _base58Alphabet[byte] + encoded;
    }

    return '1' * zeroes + encoded;
  }

  /// Converts the list to a [BigInt].
  BigInt get toBigInt {
    BigInt result = BigInt.zero;
    for (int i = 0; i < length; i++) {
      result += BigInt.from(this[i]) << (8 * (length - i - 1));
    }
    return result;
  }
}

/// Extension on [String] to convert to [Uint8List] and get hex string.
extension StringExtension on String {
  /// Converts the string to a [Uint8List].
  Uint8List hexToBytes() {
    var string = "";
    if (startsWith('0x')) {
      string = substring(2);
    } else {
      string = this;
    }

    if (string.length % 2 != 0) {
      throw Exception('String length must be even');
    }

    if (string.containsNonHexDigit()) {
      throw Exception('String contains odd characters');
    }

    int? valueOfHexDigit(int byte) {
      if (byte >= 48 && byte <= 57) {
        // 0-9
        return byte - 48;
      } else if (byte >= 65 && byte <= 70) {
        // A-F
        return byte - 55;
      } else if (byte >= 97 && byte <= 102) {
        // a-f
        return byte - 87;
      } else {
        return null;
      }
    }

    try {
      var stringData = ascii.encode(string);
      var result = <int>[];

      for (var i = 0; i < stringData.length; i += 2) {
        var high = valueOfHexDigit(stringData[i]);
        var low = i + 1 < stringData.length
            ? valueOfHexDigit(stringData[i + 1])
            : null;

        if (high == null || (low == null && i + 1 < stringData.length)) {
          throw Exception('Something wrong');
        }

        if (low != null) {
          result.add((high << 4) | low);
        } else {
          result.add(high);
        }
      }

      return Uint8List.fromList(result);
    } catch (e) {
      rethrow;
    }
  }

  /// Checks if the string contains non-hex digits.
  bool containsNonHexDigit() {
    final hexPattern = RegExp(r'[^0-9A-Fa-f]');
    return split('').any((char) => hexPattern.hasMatch(char));
  }

  /// Converts the string to a hex string.
  String get hexToString {
    try {
      // Attempt to parse the string as hex
      int.parse(this, radix: 16);
      // If successful, it's a valid hex string, so return it as is
      return this;
    } catch (e) {
      if (length % 2 != 0) {
        throw Exception('String length must be even');
      }
      var result = '';
      for (var i = 0; i < length; i += 2) {
        var byte = int.parse(substring(i, i + 2), radix: 16);
        result += String.fromCharCode(byte);
      }
      return result;
    }
  }
}

extension IntExtensionX on int {
  /// Converts the integer to a [Uint8List].
  Uint8List get serialize {
    if (this == 0) return Uint8List.fromList([0]);
    var bytes = <int>[];
    var number = this;
    while (number > 0) {
      bytes.add(number & 0xff);
      number >>= 8;
    }
    return Uint8List.fromList(bytes.reversed.toList());
  }
}

extension BigIntExtension on BigInt {
  /// Returns the absolute value of the big integer.
  BigInt get magnitude => abs();

  /// Converts the big integer to a [Uint8List].
  Uint8List get serialize {
    BigInt number = this;
    List<int> bytes = [];
    if (number == BigInt.zero) return Uint8List.fromList([0]);

    while (number > BigInt.zero) {
      bytes.add((number & BigInt.from(0xff)).toInt());
      number = number >> 8;
    }
    return Uint8List.fromList(bytes.reversed.toList());
  }

  /// Converts the big integer to a [Uint8List].
  Uint8List toBytes() {
    var byteList = <int>[];
    var byteData = toUnsigned(8 * ((bitLength + 7) >> 3)).toRadixString(16);
    for (int i = 0; i < byteData.length; i += 2) {
      byteList.add(int.parse(byteData.substring(i, i + 2), radix: 16));
    }
    return Uint8List.fromList(byteList);
  }
}
