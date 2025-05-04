part of '../generated.dart';
enum FiroAddressType {
    Default(0),
    Exchange(1),
    ;

    final int value;
    const FiroAddressType(this.value);

    static FiroAddressType? fromValue(int value) {
        switch (value) {
            case 0:
                return FiroAddressType.Default;
            case 1:
                return FiroAddressType.Exchange;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
