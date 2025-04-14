part of '../generated.dart';
enum PublicKeyType {
    Secp256k1(0),
    Secp256k1Extended(1),
    Nist256p1(2),
    Nist256p1Extended(3),
    Ed25519(4),
    Ed25519Blake2b(5),
    Curve25519(6),
    Ed25519Cardano(7),
    Starkex(8),
    ;

    final int value;
    const PublicKeyType(this.value);

    static PublicKeyType? fromValue(int value) {
        switch (value) {
            case 0:
                return PublicKeyType.Secp256k1;
            case 1:
                return PublicKeyType.Secp256k1Extended;
            case 2:
                return PublicKeyType.Nist256p1;
            case 3:
                return PublicKeyType.Nist256p1Extended;
            case 4:
                return PublicKeyType.Ed25519;
            case 5:
                return PublicKeyType.Ed25519Blake2b;
            case 6:
                return PublicKeyType.Curve25519;
            case 7:
                return PublicKeyType.Ed25519Cardano;
            case 8:
                return PublicKeyType.Starkex;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
