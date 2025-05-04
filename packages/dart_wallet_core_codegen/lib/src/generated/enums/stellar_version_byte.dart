part of '../generated.dart';
enum StellarVersionByte {
    Accountid(48),
    Seed(192),
    Preauthtx(200),
    Sha256hash(280),
    ;

    final int value;
    const StellarVersionByte(this.value);

    static StellarVersionByte? fromValue(int value) {
        switch (value) {
            case 48:
                return StellarVersionByte.Accountid;
            case 192:
                return StellarVersionByte.Seed;
            case 200:
                return StellarVersionByte.Preauthtx;
            case 280:
                return StellarVersionByte.Sha256hash;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
