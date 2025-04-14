part of 'generated.dart';
class BitcoinAddress extends Address {
    final Pointer<TWBitcoinAddress> rawValue;

    BitcoinAddress(this.rawValue);

    @override
    bool operator ==(Object other) {
        if (identical(this, other)) return true;
        return other is BitcoinAddress && WalletCore.wcb.TWBitcoinAddressEqual(rawValue, other.rawValue);
    }

    @override
    int get hashCode => rawValue.hashCode;

static BitcoinAddress? createWithString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWBitcoinAddressCreateWithString(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return BitcoinAddress(result);
}
static BitcoinAddress? createWithData(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWBitcoinAddressCreateWithData(data0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return BitcoinAddress(result);
}
static BitcoinAddress? createWithPublicKey(PublicKey publicKey, int prefix) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var result = WalletCore.wcb.TWBitcoinAddressCreateWithPublicKey(publicKey0,prefix);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return BitcoinAddress(result);
}

    void deinit() {
        WalletCore.wcb.TWBitcoinAddressDelete(rawValue);
    }

static bool isValid(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWBitcoinAddressIsValid(data0);
    deferManager.runDeferredActions();
    return result;
}
static bool isValidString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWBitcoinAddressIsValidString(string0);
    deferManager.runDeferredActions();
    return result;
}


String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinAddressDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

int get prefix {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinAddressPrefix(rawValue);
    deferManager.runDeferredActions();
    return result;
}

Uint8List get keyhash {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinAddressKeyhash(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
}
