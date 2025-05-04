part of 'generated.dart';
class SegwitAddress extends Address {
    final Pointer<TWSegwitAddress> rawValue;

    SegwitAddress(this.rawValue);

    @override
    bool operator ==(Object other) {
        if (identical(this, other)) return true;
        return other is SegwitAddress && WalletCore.wcb.TWSegwitAddressEqual(rawValue, other.rawValue);
    }

    @override
    int get hashCode => rawValue.hashCode;

static SegwitAddress? createWithString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWSegwitAddressCreateWithString(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return SegwitAddress(result);
}
static SegwitAddress createWithPublicKey(HRP hrp, PublicKey publicKey) {
    final deferManager = DeferManager();
    var hrp0 = hrp.value;
    var publicKey0 = publicKey.rawValue;
    var result = WalletCore.wcb.TWSegwitAddressCreateWithPublicKey(hrp0,publicKey0);

    deferManager.runDeferredActions();
    return SegwitAddress(result);
}

    void deinit() {
        WalletCore.wcb.TWSegwitAddressDelete(rawValue);
    }

static bool isValidString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWSegwitAddressIsValidString(string0);
    deferManager.runDeferredActions();
    return result;
}


String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWSegwitAddressDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

HRP get hrp {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWSegwitAddressHRP(rawValue);
    deferManager.runDeferredActions();
    return HRP.fromValue(result)!;
}

int get witnessVersion {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWSegwitAddressWitnessVersion(rawValue);
    deferManager.runDeferredActions();
    return result;
}

Uint8List get witnessProgram {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWSegwitAddressWitnessProgram(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
}
