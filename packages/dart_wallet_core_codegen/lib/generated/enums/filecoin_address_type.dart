part of '../generated.dart';
enum FilecoinAddressType {
    Default(0),
    Delegated(1),
    ;

    final int value;
    const FilecoinAddressType(this.value);

    static FilecoinAddressType? fromValue(int value) {
        switch (value) {
            case 0:
                return FilecoinAddressType.Default;
            case 1:
                return FilecoinAddressType.Delegated;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
