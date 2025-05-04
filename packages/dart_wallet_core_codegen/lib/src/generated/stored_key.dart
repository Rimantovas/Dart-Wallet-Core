part of 'generated.dart';
class StoredKey {
    final Pointer<TWStoredKey> rawValue;

    StoredKey(this.rawValue);


static StoredKey createLevel(String name, Uint8List password, StoredKeyEncryptionLevel encryptionLevel) {
    final deferManager = DeferManager();
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var encryptionLevel0 = encryptionLevel.value;
    var result = WalletCore.wcb.TWStoredKeyCreateLevel(name0,password0,encryptionLevel0);

    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey createLevelAndEncryption(String name, Uint8List password, StoredKeyEncryptionLevel encryptionLevel, StoredKeyEncryption encryption) {
    final deferManager = DeferManager();
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var encryptionLevel0 = encryptionLevel.value;
    var encryption0 = encryption.value;
    var result = WalletCore.wcb.TWStoredKeyCreateLevelAndEncryption(name0,password0,encryptionLevel0,encryption0);

    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey create(String name, Uint8List password) {
    final deferManager = DeferManager();
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var result = WalletCore.wcb.TWStoredKeyCreate(name0,password0);

    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey createEncryption(String name, Uint8List password, StoredKeyEncryption encryption) {
    final deferManager = DeferManager();
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var encryption0 = encryption.value;
    var result = WalletCore.wcb.TWStoredKeyCreateEncryption(name0,password0,encryption0);

    deferManager.runDeferredActions();
    return StoredKey(result);
}

    void deinit() {
        WalletCore.wcb.TWStoredKeyDelete(rawValue);
    }

static StoredKey? load(String path) {
    final deferManager = DeferManager();
    var path0 = TWStringCreateWithNSString(path);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(path0);
    });
    var result = WalletCore.wcb.TWStoredKeyLoad(path0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey? importPrivateKey(Uint8List privateKey, String name, Uint8List password, CoinType coin) {
    final deferManager = DeferManager();
    var privateKey0 = TWDataCreateWithNSData(privateKey);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(privateKey0);
    });
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWStoredKeyImportPrivateKey(privateKey0,name0,password0,coin0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey? importPrivateKeyWithEncryption(Uint8List privateKey, String name, Uint8List password, CoinType coin, StoredKeyEncryption encryption) {
    final deferManager = DeferManager();
    var privateKey0 = TWDataCreateWithNSData(privateKey);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(privateKey0);
    });
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var coin0 = coin.value;
    var encryption0 = encryption.value;
    var result = WalletCore.wcb.TWStoredKeyImportPrivateKeyWithEncryption(privateKey0,name0,password0,coin0,encryption0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey? importPrivateKeyEncoded(String privateKey, String name, Uint8List password, CoinType coin) {
    final deferManager = DeferManager();
    var privateKey0 = TWStringCreateWithNSString(privateKey);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(privateKey0);
    });
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWStoredKeyImportPrivateKeyEncoded(privateKey0,name0,password0,coin0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey? importPrivateKeyEncodedWithEncryption(String privateKey, String name, Uint8List password, CoinType coin, StoredKeyEncryption encryption) {
    final deferManager = DeferManager();
    var privateKey0 = TWStringCreateWithNSString(privateKey);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(privateKey0);
    });
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var coin0 = coin.value;
    var encryption0 = encryption.value;
    var result = WalletCore.wcb.TWStoredKeyImportPrivateKeyEncodedWithEncryption(privateKey0,name0,password0,coin0,encryption0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey? importHDWallet(String mnemonic, String name, Uint8List password, CoinType coin) {
    final deferManager = DeferManager();
    var mnemonic0 = TWStringCreateWithNSString(mnemonic);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(mnemonic0);
    });
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWStoredKeyImportHDWallet(mnemonic0,name0,password0,coin0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey? importHDWalletWithEncryption(String mnemonic, String name, Uint8List password, CoinType coin, StoredKeyEncryption encryption) {
    final deferManager = DeferManager();
    var mnemonic0 = TWStringCreateWithNSString(mnemonic);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(mnemonic0);
    });
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var coin0 = coin.value;
    var encryption0 = encryption.value;
    var result = WalletCore.wcb.TWStoredKeyImportHDWalletWithEncryption(mnemonic0,name0,password0,coin0,encryption0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return StoredKey(result);
}
static StoredKey? importJSON(Uint8List json) {
    final deferManager = DeferManager();
    var json0 = TWDataCreateWithNSData(json);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(json0);
    });
    var result = WalletCore.wcb.TWStoredKeyImportJSON(json0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return StoredKey(result);
}
Account? account(int index) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWStoredKeyAccount(obj,index);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return Account(result);
}
Account? accountForCoin(CoinType coin, HDWallet? wallet) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var wallet0 = wallet?.rawValue ?? nullptr;
    var result = WalletCore.wcb.TWStoredKeyAccountForCoin(obj,coin0,wallet0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return Account(result);
}
Account? accountForCoinDerivation(CoinType coin, Derivation derivation, HDWallet? wallet) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var wallet0 = wallet?.rawValue ?? nullptr;
    var result = WalletCore.wcb.TWStoredKeyAccountForCoinDerivation(obj,coin0,derivation0,wallet0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return Account(result);
}
void addAccountDerivation(String address, CoinType coin, Derivation derivation, String derivationPath, String publicKey, String extendedPublicKey) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var address0 = TWStringCreateWithNSString(address);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(address0);
    });
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var derivationPath0 = TWStringCreateWithNSString(derivationPath);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(derivationPath0);
    });
    var publicKey0 = TWStringCreateWithNSString(publicKey);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(publicKey0);
    });
    var extendedPublicKey0 = TWStringCreateWithNSString(extendedPublicKey);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(extendedPublicKey0);
    });
    var result = WalletCore.wcb.TWStoredKeyAddAccountDerivation(obj,address0,coin0,derivation0,derivationPath0,publicKey0,extendedPublicKey0);
    deferManager.runDeferredActions();
    return result;
}
void addAccount(String address, CoinType coin, String derivationPath, String publicKey, String extendedPublicKey) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var address0 = TWStringCreateWithNSString(address);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(address0);
    });
    var coin0 = coin.value;
    var derivationPath0 = TWStringCreateWithNSString(derivationPath);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(derivationPath0);
    });
    var publicKey0 = TWStringCreateWithNSString(publicKey);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(publicKey0);
    });
    var extendedPublicKey0 = TWStringCreateWithNSString(extendedPublicKey);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(extendedPublicKey0);
    });
    var result = WalletCore.wcb.TWStoredKeyAddAccount(obj,address0,coin0,derivationPath0,publicKey0,extendedPublicKey0);
    deferManager.runDeferredActions();
    return result;
}
void removeAccountForCoin(CoinType coin) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWStoredKeyRemoveAccountForCoin(obj,coin0);
    deferManager.runDeferredActions();
    return result;
}
void removeAccountForCoinDerivation(CoinType coin, Derivation derivation) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var result = WalletCore.wcb.TWStoredKeyRemoveAccountForCoinDerivation(obj,coin0,derivation0);
    deferManager.runDeferredActions();
    return result;
}
void removeAccountForCoinDerivationPath(CoinType coin, String derivationPath) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var derivationPath0 = TWStringCreateWithNSString(derivationPath);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(derivationPath0);
    });
    var result = WalletCore.wcb.TWStoredKeyRemoveAccountForCoinDerivationPath(obj,coin0,derivationPath0);
    deferManager.runDeferredActions();
    return result;
}
bool store(String path) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var path0 = TWStringCreateWithNSString(path);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(path0);
    });
    var result = WalletCore.wcb.TWStoredKeyStore(obj,path0);
    deferManager.runDeferredActions();
    return result;
}
Uint8List? decryptPrivateKey(Uint8List password) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var result = WalletCore.wcb.TWStoredKeyDecryptPrivateKey(obj,password0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
String? decryptPrivateKeyEncoded(Uint8List password) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var result = WalletCore.wcb.TWStoredKeyDecryptPrivateKeyEncoded(obj,password0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
String? decryptMnemonic(Uint8List password) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var result = WalletCore.wcb.TWStoredKeyDecryptMnemonic(obj,password0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
PrivateKey? privateKey(CoinType coin, Uint8List password) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var result = WalletCore.wcb.TWStoredKeyPrivateKey(obj,coin0,password0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return PrivateKey(result);
}
HDWallet? wallet(Uint8List password) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var result = WalletCore.wcb.TWStoredKeyWallet(obj,password0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return HDWallet(result);
}
Uint8List? exportJSON() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWStoredKeyExportJSON(obj);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
bool fixAddresses(Uint8List password) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var result = WalletCore.wcb.TWStoredKeyFixAddresses(obj,password0);
    deferManager.runDeferredActions();
    return result;
}
bool updateAddress(CoinType coin) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWStoredKeyUpdateAddress(obj,coin0);
    deferManager.runDeferredActions();
    return result;
}


String? get identifier {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWStoredKeyIdentifier(rawValue);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

String get name {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWStoredKeyName(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

bool get isMnemonic {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWStoredKeyIsMnemonic(rawValue);
    deferManager.runDeferredActions();
    return result;
}

int get accountCount {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWStoredKeyAccountCount(rawValue);
    deferManager.runDeferredActions();
    return result;
}

bool get hasPrivateKeyEncoded {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWStoredKeyHasPrivateKeyEncoded(rawValue);
    deferManager.runDeferredActions();
    return result;
}

String? get encryptionParameters {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWStoredKeyEncryptionParameters(rawValue);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
}
