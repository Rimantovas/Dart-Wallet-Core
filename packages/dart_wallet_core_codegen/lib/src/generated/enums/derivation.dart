part of '../generated.dart';
enum Derivation {
    Default(0),
    Custom(1),
    BitcoinSegwit(2),
    BitcoinLegacy(3),
    BitcoinTestnet(4),
    LitecoinLegacy(5),
    SolanaSolana(6),
    StratisSegwit(7),
    BitcoinTaproot(8),
    PactusMainnet(9),
    PactusTestnet(10),
    ;

    final int value;
    const Derivation(this.value);

    static Derivation? fromValue(int value) {
        switch (value) {
            case 0:
                return Derivation.Default;
            case 1:
                return Derivation.Custom;
            case 2:
                return Derivation.BitcoinSegwit;
            case 3:
                return Derivation.BitcoinLegacy;
            case 4:
                return Derivation.BitcoinTestnet;
            case 5:
                return Derivation.LitecoinLegacy;
            case 6:
                return Derivation.SolanaSolana;
            case 7:
                return Derivation.StratisSegwit;
            case 8:
                return Derivation.BitcoinTaproot;
            case 9:
                return Derivation.PactusMainnet;
            case 10:
                return Derivation.PactusTestnet;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
