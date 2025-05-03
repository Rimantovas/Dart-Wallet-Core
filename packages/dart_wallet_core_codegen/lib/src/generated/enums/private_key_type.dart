part of '../generated.dart';
enum PrivateKeyType {
    Default(0),
    Cardano(1),
    ;

    final int value;
    const PrivateKeyType(this.value);

    static PrivateKeyType? fromValue(int value) {
        switch (value) {
            case 0:
                return PrivateKeyType.Default;
            case 1:
                return PrivateKeyType.Cardano;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
