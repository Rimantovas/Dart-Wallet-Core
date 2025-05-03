part of 'generated.dart';
extension CoinTypeExtension on CoinType {
bool validate(String address) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var address0 = TWStringCreateWithNSString(address);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(address0);
    });
    var result = WalletCore.wcb.TWCoinTypeValidate(obj,address0);
    deferManager.runDeferredActions();
    return result;
}

String derivationPath() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWCoinTypeDerivationPath(obj);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

String derivationPathWithDerivation(Derivation derivation) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var derivation0 = derivation.value;
    var result = WalletCore.wcb.TWCoinTypeDerivationPathWithDerivation(obj,derivation0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

String deriveAddress(PrivateKey privateKey) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var privateKey0 = privateKey.rawValue;
    var result = WalletCore.wcb.TWCoinTypeDeriveAddress(obj,privateKey0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

String deriveAddressFromPublicKey(PublicKey publicKey) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var publicKey0 = publicKey.rawValue;
    var result = WalletCore.wcb.TWCoinTypeDeriveAddressFromPublicKey(obj,publicKey0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

String deriveAddressFromPublicKeyAndDerivation(PublicKey publicKey, Derivation derivation) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var publicKey0 = publicKey.rawValue;
    var derivation0 = derivation.value;
    var result = WalletCore.wcb.TWCoinTypeDeriveAddressFromPublicKeyAndDerivation(obj,publicKey0,derivation0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

Blockchain get blockchain {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeBlockchain(rawValue);
    deferManager.runDeferredActions();
    return Blockchain.fromValue(result)!;
}


Purpose get purpose {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypePurpose(rawValue);
    deferManager.runDeferredActions();
    return Purpose.fromValue(result)!;
}


Curve get curve {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeCurve(rawValue);
    deferManager.runDeferredActions();
    return Curve.fromValue(result)!;
}


HDVersion get xpubVersion {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeXpubVersion(rawValue);
    deferManager.runDeferredActions();
    return HDVersion.fromValue(result)!;
}


HDVersion get xprvVersion {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeXprvVersion(rawValue);
    deferManager.runDeferredActions();
    return HDVersion.fromValue(result)!;
}


HRP get hrp {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeHRP(rawValue);
    deferManager.runDeferredActions();
    return HRP.fromValue(result)!;
}


int get p2pkhPrefix {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeP2pkhPrefix(rawValue);
    deferManager.runDeferredActions();
    return result;
}


int get p2shPrefix {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeP2shPrefix(rawValue);
    deferManager.runDeferredActions();
    return result;
}


int get staticPrefix {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeStaticPrefix(rawValue);
    deferManager.runDeferredActions();
    return result;
}


String get chainId {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeChainId(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}


int get slip44Id {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeSlip44Id(rawValue);
    deferManager.runDeferredActions();
    return result;
}


int get ss58Prefix {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypeSS58Prefix(rawValue);
    deferManager.runDeferredActions();
    return result;
}


PublicKeyType get publicKeyType {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCoinTypePublicKeyType(rawValue);
    deferManager.runDeferredActions();
    return PublicKeyType.fromValue(result)!;
}
}
