part of 'generated.dart';
class HDWallet {
    final Pointer<TWHDWallet> rawValue;

    HDWallet(this.rawValue);


static HDWallet? create(int strength, String passphrase) {
    final deferManager = DeferManager();
    var passphrase0 = TWStringCreateWithNSString(passphrase);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(passphrase0);
    });
    var result = WalletCore.wcb.TWHDWalletCreate(strength,passphrase0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return HDWallet(result);
}
static HDWallet? createWithMnemonic(String mnemonic, String passphrase) {
    final deferManager = DeferManager();
    var mnemonic0 = TWStringCreateWithNSString(mnemonic);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(mnemonic0);
    });
    var passphrase0 = TWStringCreateWithNSString(passphrase);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(passphrase0);
    });
    var result = WalletCore.wcb.TWHDWalletCreateWithMnemonic(mnemonic0,passphrase0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return HDWallet(result);
}
static HDWallet? createWithMnemonicCheck(String mnemonic, String passphrase, bool check) {
    final deferManager = DeferManager();
    var mnemonic0 = TWStringCreateWithNSString(mnemonic);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(mnemonic0);
    });
    var passphrase0 = TWStringCreateWithNSString(passphrase);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(passphrase0);
    });
    var result = WalletCore.wcb.TWHDWalletCreateWithMnemonicCheck(mnemonic0,passphrase0,check);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return HDWallet(result);
}
static HDWallet? createWithEntropy(Uint8List entropy, String passphrase) {
    final deferManager = DeferManager();
    var entropy0 = TWDataCreateWithNSData(entropy);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(entropy0);
    });
    var passphrase0 = TWStringCreateWithNSString(passphrase);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(passphrase0);
    });
    var result = WalletCore.wcb.TWHDWalletCreateWithEntropy(entropy0,passphrase0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return HDWallet(result);
}

    void deinit() {
        WalletCore.wcb.TWHDWalletDelete(rawValue);
    }

PrivateKey getMasterKey(Curve curve) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var curve0 = curve.value;
    var result = WalletCore.wcb.TWHDWalletGetMasterKey(obj,curve0);
    deferManager.runDeferredActions();
    return PrivateKey(result);
}
PrivateKey getKeyForCoin(CoinType coin) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWHDWalletGetKeyForCoin(obj,coin0);
    deferManager.runDeferredActions();
    return PrivateKey(result);
}
String getAddressForCoin(CoinType coin) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWHDWalletGetAddressForCoin(obj,coin0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
String getAddressDerivation(CoinType coin, Derivation derivation) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var result = WalletCore.wcb.TWHDWalletGetAddressDerivation(obj,coin0,derivation0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
PrivateKey getKey(CoinType coin, String derivationPath) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var derivationPath0 = TWStringCreateWithNSString(derivationPath);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(derivationPath0);
    });
    var result = WalletCore.wcb.TWHDWalletGetKey(obj,coin0,derivationPath0);
    deferManager.runDeferredActions();
    return PrivateKey(result);
}
PrivateKey getKeyDerivation(CoinType coin, Derivation derivation) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var result = WalletCore.wcb.TWHDWalletGetKeyDerivation(obj,coin0,derivation0);
    deferManager.runDeferredActions();
    return PrivateKey(result);
}
PrivateKey getKeyByCurve(Curve curve, String derivationPath) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var curve0 = curve.value;
    var derivationPath0 = TWStringCreateWithNSString(derivationPath);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(derivationPath0);
    });
    var result = WalletCore.wcb.TWHDWalletGetKeyByCurve(obj,curve0,derivationPath0);
    deferManager.runDeferredActions();
    return PrivateKey(result);
}
PrivateKey getDerivedKey(CoinType coin, int account, int change, int address) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWHDWalletGetDerivedKey(obj,coin0,account,change,address);
    deferManager.runDeferredActions();
    return PrivateKey(result);
}
String getExtendedPrivateKey(Purpose purpose, CoinType coin, HDVersion version) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var purpose0 = purpose.value;
    var coin0 = coin.value;
    var version0 = version.value;
    var result = WalletCore.wcb.TWHDWalletGetExtendedPrivateKey(obj,purpose0,coin0,version0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
String getExtendedPublicKey(Purpose purpose, CoinType coin, HDVersion version) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var purpose0 = purpose.value;
    var coin0 = coin.value;
    var version0 = version.value;
    var result = WalletCore.wcb.TWHDWalletGetExtendedPublicKey(obj,purpose0,coin0,version0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
String getExtendedPrivateKeyAccount(Purpose purpose, CoinType coin, Derivation derivation, HDVersion version, int account) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var purpose0 = purpose.value;
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var version0 = version.value;
    var result = WalletCore.wcb.TWHDWalletGetExtendedPrivateKeyAccount(obj,purpose0,coin0,derivation0,version0,account);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
String getExtendedPublicKeyAccount(Purpose purpose, CoinType coin, Derivation derivation, HDVersion version, int account) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var purpose0 = purpose.value;
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var version0 = version.value;
    var result = WalletCore.wcb.TWHDWalletGetExtendedPublicKeyAccount(obj,purpose0,coin0,derivation0,version0,account);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
String getExtendedPrivateKeyDerivation(Purpose purpose, CoinType coin, Derivation derivation, HDVersion version) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var purpose0 = purpose.value;
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var version0 = version.value;
    var result = WalletCore.wcb.TWHDWalletGetExtendedPrivateKeyDerivation(obj,purpose0,coin0,derivation0,version0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
String getExtendedPublicKeyDerivation(Purpose purpose, CoinType coin, Derivation derivation, HDVersion version) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var purpose0 = purpose.value;
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var version0 = version.value;
    var result = WalletCore.wcb.TWHDWalletGetExtendedPublicKeyDerivation(obj,purpose0,coin0,derivation0,version0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static PublicKey? getPublicKeyFromExtended(String extended, CoinType coin, String derivationPath) {
    final deferManager = DeferManager();
    var extended0 = TWStringCreateWithNSString(extended);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(extended0);
    });
    var coin0 = coin.value;
    var derivationPath0 = TWStringCreateWithNSString(derivationPath);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(derivationPath0);
    });
    var result = WalletCore.wcb.TWHDWalletGetPublicKeyFromExtended(extended0,coin0,derivationPath0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return PublicKey(result);
}


Uint8List get seed {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWHDWalletSeed(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

String get mnemonic {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWHDWalletMnemonic(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

Uint8List get entropy {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWHDWalletEntropy(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
}
