part of '../generated.dart';
enum StellarVersionByte {
    AccountId(0x30),
    Seed(0xc0),
    PreAuthTx(0xc8),
    Sha256Hash(0x118),
    ;

    final int value;
    const StellarVersionByte(this.value);

    static StellarVersionByte? fromValue(int value) {
        switch (value) {
            case 0x30:
                return StellarVersionByte.AccountId;
            case 0xc0:
                return StellarVersionByte.Seed;
            case 0xc8:
                return StellarVersionByte.PreAuthTx;
            case 0x118:
                return StellarVersionByte.Sha256Hash;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
