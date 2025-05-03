part of '../generated.dart';
enum BitcoinSigHashType {
    All(1),
    None(2),
    Single(3),
    Fork(64),
    Forkbtg(20288),
    AnyoneCanPay(128),
    ;

    final int value;
    const BitcoinSigHashType(this.value);

    static BitcoinSigHashType? fromValue(int value) {
        switch (value) {
            case 1:
                return BitcoinSigHashType.All;
            case 2:
                return BitcoinSigHashType.None;
            case 3:
                return BitcoinSigHashType.Single;
            case 64:
                return BitcoinSigHashType.Fork;
            case 20288:
                return BitcoinSigHashType.Forkbtg;
            case 128:
                return BitcoinSigHashType.AnyoneCanPay;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
