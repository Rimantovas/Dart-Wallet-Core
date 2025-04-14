part of 'generated.dart';
class AnyAddress extends Address {
    final Pointer<TWAnyAddress> rawValue;

    AnyAddress(this.rawValue);

    @override
    bool operator ==(Object other) {
        if (identical(this, other)) return true;
        return other is AnyAddress && WalletCore.wcb.TWAnyAddressEqual(rawValue, other.rawValue);
    }

    @override
    int get hashCode => rawValue.hashCode;

static AnyAddress? createWithString(String string, CoinType coin) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWAnyAddressCreateWithString(string0,coin0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return AnyAddress(result);
}
static AnyAddress? createBech32(String string, CoinType coin, String hrp) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var coin0 = coin.value;
    var hrp0 = TWStringCreateWithNSString(hrp);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(hrp0);
    });
    var result = WalletCore.wcb.TWAnyAddressCreateBech32(string0,coin0,hrp0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return AnyAddress(result);
}
static AnyAddress? createSS58(String string, CoinType coin, int ss58Prefix) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWAnyAddressCreateSS58(string0,coin0,ss58Prefix);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return AnyAddress(result);
}
static AnyAddress createWithPublicKey(PublicKey publicKey, CoinType coin) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWAnyAddressCreateWithPublicKey(publicKey0,coin0);

    deferManager.runDeferredActions();
    return AnyAddress(result);
}
static AnyAddress createWithPublicKeyDerivation(PublicKey publicKey, CoinType coin, Derivation derivation) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var coin0 = coin.value;
    var derivation0 = derivation.value;
    var result = WalletCore.wcb.TWAnyAddressCreateWithPublicKeyDerivation(publicKey0,coin0,derivation0);

    deferManager.runDeferredActions();
    return AnyAddress(result);
}
static AnyAddress createBech32WithPublicKey(PublicKey publicKey, CoinType coin, String hrp) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var coin0 = coin.value;
    var hrp0 = TWStringCreateWithNSString(hrp);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(hrp0);
    });
    var result = WalletCore.wcb.TWAnyAddressCreateBech32WithPublicKey(publicKey0,coin0,hrp0);

    deferManager.runDeferredActions();
    return AnyAddress(result);
}
static AnyAddress createSS58WithPublicKey(PublicKey publicKey, CoinType coin, int ss58Prefix) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWAnyAddressCreateSS58WithPublicKey(publicKey0,coin0,ss58Prefix);

    deferManager.runDeferredActions();
    return AnyAddress(result);
}
static AnyAddress createWithPublicKeyFilecoinAddressType(PublicKey publicKey, FilecoinAddressType filecoinAddressType) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var filecoinAddressType0 = filecoinAddressType.value;
    var result = WalletCore.wcb.TWAnyAddressCreateWithPublicKeyFilecoinAddressType(publicKey0,filecoinAddressType0);

    deferManager.runDeferredActions();
    return AnyAddress(result);
}

    void deinit() {
        WalletCore.wcb.TWAnyAddressDelete(rawValue);
    }

static bool isValid(String string, CoinType coin) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWAnyAddressIsValid(string0,coin0);
    deferManager.runDeferredActions();
    return result;
}
static bool isValidBech32(String string, CoinType coin, String hrp) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var coin0 = coin.value;
    var hrp0 = TWStringCreateWithNSString(hrp);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(hrp0);
    });
    var result = WalletCore.wcb.TWAnyAddressIsValidBech32(string0,coin0,hrp0);
    deferManager.runDeferredActions();
    return result;
}
static bool isValidSs58(String string, CoinType coin, int ss58Prefix) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWAnyAddressIsValidSS58(string0,coin0,ss58Prefix);
    deferManager.runDeferredActions();
    return result;
}


String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWAnyAddressDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

CoinType get coin {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWAnyAddressCoin(rawValue);
    deferManager.runDeferredActions();
    return CoinType.fromValue(result)!;
}

Uint8List get data {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWAnyAddressData(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
}
