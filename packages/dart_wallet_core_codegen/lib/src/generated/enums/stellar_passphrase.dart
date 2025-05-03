part of '../generated.dart';
enum StellarPassphrase {
    Stellar(0),
    Kin(1),
    ;

    final int value;
    const StellarPassphrase(this.value);

    static StellarPassphrase? fromValue(int value) {
        switch (value) {
            case 0:
                return StellarPassphrase.Stellar;
            case 1:
                return StellarPassphrase.Kin;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
