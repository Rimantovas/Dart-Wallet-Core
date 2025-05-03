part of '../generated.dart';
enum Curve {
    Secp256k1(0),
    Ed25519(1),
    Ed25519blake2bnano(2),
    Curve25519(3),
    Nist256p1(4),
    Ed25519extendedcardano(5),
    Starkex(6),
    None(7),
    ;

    final int value;
    const Curve(this.value);

    static Curve? fromValue(int value) {
        switch (value) {
            case 0:
                return Curve.Secp256k1;
            case 1:
                return Curve.Ed25519;
            case 2:
                return Curve.Ed25519blake2bnano;
            case 3:
                return Curve.Curve25519;
            case 4:
                return Curve.Nist256p1;
            case 5:
                return Curve.Ed25519extendedcardano;
            case 6:
                return Curve.Starkex;
            case 7:
                return Curve.None;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
