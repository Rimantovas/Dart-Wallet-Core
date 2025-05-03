part of '../generated.dart';
enum Purpose {
    Bip44(44),
    Bip49(49),
    Bip84(84),
    Bip86(86),
    Bip1852(1852),
    ;

    final int value;
    const Purpose(this.value);

    static Purpose? fromValue(int value) {
        switch (value) {
            case 44:
                return Purpose.Bip44;
            case 49:
                return Purpose.Bip49;
            case 84:
                return Purpose.Bip84;
            case 86:
                return Purpose.Bip86;
            case 1852:
                return Purpose.Bip1852;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
