part of '../generated.dart';
enum BitcoinSigHashType {
    All(0x01),
    None(0x02),
    Single(0x03),
    Fork(0x40),
    ForkBtg(0x4f40),
    AnyoneCanPay(0x80),
    ;

    final int value;
    const BitcoinSigHashType(this.value);

    static BitcoinSigHashType? fromValue(int value) {
        switch (value) {
            case 0x01:
                return BitcoinSigHashType.All;
            case 0x02:
                return BitcoinSigHashType.None;
            case 0x03:
                return BitcoinSigHashType.Single;
            case 0x40:
                return BitcoinSigHashType.Fork;
            case 0x4f40:
                return BitcoinSigHashType.ForkBtg;
            case 0x80:
                return BitcoinSigHashType.AnyoneCanPay;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
