part of 'generated.dart';
class NervosAddress extends Address {
    final Pointer<TWNervosAddress> rawValue;

    NervosAddress(this.rawValue);

    @override
    bool operator ==(Object other) {
        if (identical(this, other)) return true;
        return other is NervosAddress && WalletCore.wcb.TWNervosAddressEqual(rawValue, other.rawValue);
    }

    @override
    int get hashCode => rawValue.hashCode;

static NervosAddress? createWithString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWNervosAddressCreateWithString(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return NervosAddress(result);
}

    void deinit() {
        WalletCore.wcb.TWNervosAddressDelete(rawValue);
    }

static bool isValidString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWNervosAddressIsValidString(string0);
    deferManager.runDeferredActions();
    return result;
}


String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWNervosAddressDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

Uint8List get codeHash {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWNervosAddressCodeHash(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

String get hashType {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWNervosAddressHashType(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

Uint8List get args {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWNervosAddressArgs(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
}
