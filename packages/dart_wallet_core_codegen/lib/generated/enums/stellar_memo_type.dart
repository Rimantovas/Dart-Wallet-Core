part of '../generated.dart';
enum StellarMemoType {
    None(0),
    Text(1),
    Id(2),
    Hash(3),
    Return(4),
    ;

    final int value;
    const StellarMemoType(this.value);

    static StellarMemoType? fromValue(int value) {
        switch (value) {
            case 0:
                return StellarMemoType.None;
            case 1:
                return StellarMemoType.Text;
            case 2:
                return StellarMemoType.Id;
            case 3:
                return StellarMemoType.Hash;
            case 4:
                return StellarMemoType.Return;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
