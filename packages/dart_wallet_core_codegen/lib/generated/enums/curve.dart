part of '../generated.dart';
enum Curve {
    Secp256k1(0),
    Ed25519(1),
    Ed25519Blake2bNano(2),
    Curve25519(3),
    Nist256p1(4),
    Ed25519ExtendedCardano(5),
    Starkex(6),
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
                return Curve.Ed25519Blake2bNano;
            case 3:
                return Curve.Curve25519;
            case 4:
                return Curve.Nist256p1;
            case 5:
                return Curve.Ed25519ExtendedCardano;
            case 6:
                return Curve.Starkex;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

    @override
    String toString() {
        switch (this) {
            case Secp256k1:
                return "secp256k1";
            case Ed25519:
                return "ed25519";
            case Ed25519Blake2bNano:
                return "ed25519-blake2b-nano";
            case Curve25519:
                return "curve25519";
            case Nist256p1:
                return "nist256p1";
            case Ed25519ExtendedCardano:
                return "ed25519-cardano-seed";
            case Starkex:
                return "starkex";
        }
    }
}
