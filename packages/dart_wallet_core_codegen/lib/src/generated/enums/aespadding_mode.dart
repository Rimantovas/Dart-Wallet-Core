part of '../generated.dart';
enum AESPaddingMode {
    Zero(0),
    Pkcs7(1),
    ;

    final int value;
    const AESPaddingMode(this.value);

    static AESPaddingMode? fromValue(int value) {
        switch (value) {
            case 0:
                return AESPaddingMode.Zero;
            case 1:
                return AESPaddingMode.Pkcs7;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
