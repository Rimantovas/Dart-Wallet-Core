part of '../generated.dart';
enum StoredKeyEncryption {
    Aes128Ctr(0),
    Aes128Cbc(1),
    Aes192Ctr(2),
    Aes256Ctr(3),
    ;

    final int value;
    const StoredKeyEncryption(this.value);

    static StoredKeyEncryption? fromValue(int value) {
        switch (value) {
            case 0:
                return StoredKeyEncryption.Aes128Ctr;
            case 1:
                return StoredKeyEncryption.Aes128Cbc;
            case 2:
                return StoredKeyEncryption.Aes192Ctr;
            case 3:
                return StoredKeyEncryption.Aes256Ctr;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
