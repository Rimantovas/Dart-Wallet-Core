part of '../generated.dart';
enum SS58AddressType {
    Polkadot(0),
    Kusama(2),
    ;

    final int value;
    const SS58AddressType(this.value);

    static SS58AddressType? fromValue(int value) {
        switch (value) {
            case 0:
                return SS58AddressType.Polkadot;
            case 2:
                return SS58AddressType.Kusama;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
