part of 'generated.dart';
class Account {
    final Pointer<TWAccount> rawValue;

    Account(this.rawValue);


static Account create(String address, CoinType coin, Derivation derivation, String derivationPath, String publicKey, String extendedPublicKey) {
    final deferManager = DeferManager();
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
    var result = WalletCore.wcb.TWAccountCreate(address0,coin0,derivation0,derivationPath0,publicKey0,extendedPublicKey0);

    deferManager.runDeferredActions();
    return Account(result);
}

    void deinit() {
        WalletCore.wcb.TWAccountDelete(rawValue);
    }



String get address {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWAccountAddress(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

CoinType get coin {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWAccountCoin(rawValue);
    deferManager.runDeferredActions();
    return CoinType.fromValue(result)!;
}

Derivation get derivation {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWAccountDerivation(rawValue);
    deferManager.runDeferredActions();
    return Derivation.fromValue(result)!;
}

String get derivationPath {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWAccountDerivationPath(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

String get publicKey {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWAccountPublicKey(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

String get extendedPublicKey {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWAccountExtendedPublicKey(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
}
