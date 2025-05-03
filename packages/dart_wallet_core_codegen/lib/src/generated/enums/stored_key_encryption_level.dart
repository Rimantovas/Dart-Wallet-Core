part of '../generated.dart';
enum StoredKeyEncryptionLevel {
    Default(0),
    Minimal(1),
    Weak(2),
    Standard(3),
    ;

    final int value;
    const StoredKeyEncryptionLevel(this.value);

    static StoredKeyEncryptionLevel? fromValue(int value) {
        switch (value) {
            case 0:
                return StoredKeyEncryptionLevel.Default;
            case 1:
                return StoredKeyEncryptionLevel.Minimal;
            case 2:
                return StoredKeyEncryptionLevel.Weak;
            case 3:
                return StoredKeyEncryptionLevel.Standard;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
