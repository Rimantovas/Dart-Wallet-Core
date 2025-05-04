part of 'generated.dart';
class GroestlcoinAddress extends Address {
    final Pointer<TWGroestlcoinAddress> rawValue;

    GroestlcoinAddress(this.rawValue);

    @override
    bool operator ==(Object other) {
        if (identical(this, other)) return true;
        return other is GroestlcoinAddress && WalletCore.wcb.TWGroestlcoinAddressEqual(rawValue, other.rawValue);
    }

    @override
    int get hashCode => rawValue.hashCode;

static GroestlcoinAddress? createWithString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWGroestlcoinAddressCreateWithString(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return GroestlcoinAddress(result);
}
static GroestlcoinAddress createWithPublicKey(PublicKey publicKey, int prefix) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var result = WalletCore.wcb.TWGroestlcoinAddressCreateWithPublicKey(publicKey0,prefix);

    deferManager.runDeferredActions();
    return GroestlcoinAddress(result);
}

    void deinit() {
        WalletCore.wcb.TWGroestlcoinAddressDelete(rawValue);
    }

static bool isValidString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWGroestlcoinAddressIsValidString(string0);
    deferManager.runDeferredActions();
    return result;
}


String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWGroestlcoinAddressDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
}
