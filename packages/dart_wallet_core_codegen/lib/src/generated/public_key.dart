part of 'generated.dart';
class PublicKey {
    final Pointer<TWPublicKey> rawValue;

    PublicKey(this.rawValue);


static PublicKey? createWithData(Uint8List data, PublicKeyType type) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var type0 = type.value;
    var result = WalletCore.wcb.TWPublicKeyCreateWithData(data0,type0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return PublicKey(result);
}

    void deinit() {
        WalletCore.wcb.TWPublicKeyDelete(rawValue);
    }

static bool isValid(Uint8List data, PublicKeyType type) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var type0 = type.value;
    var result = WalletCore.wcb.TWPublicKeyIsValid(data0,type0);
    deferManager.runDeferredActions();
    return result;
}
bool verify(Uint8List signature, Uint8List message) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var signature0 = TWDataCreateWithNSData(signature);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(signature0);
    });
    var message0 = TWDataCreateWithNSData(message);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(message0);
    });
    var result = WalletCore.wcb.TWPublicKeyVerify(obj,signature0,message0);
    deferManager.runDeferredActions();
    return result;
}
bool verifyAsDER(Uint8List signature, Uint8List message) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var signature0 = TWDataCreateWithNSData(signature);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(signature0);
    });
    var message0 = TWDataCreateWithNSData(message);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(message0);
    });
    var result = WalletCore.wcb.TWPublicKeyVerifyAsDER(obj,signature0,message0);
    deferManager.runDeferredActions();
    return result;
}
bool verifyZilliqaSchnorr(Uint8List signature, Uint8List message) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var signature0 = TWDataCreateWithNSData(signature);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(signature0);
    });
    var message0 = TWDataCreateWithNSData(message);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(message0);
    });
    var result = WalletCore.wcb.TWPublicKeyVerifyZilliqaSchnorr(obj,signature0,message0);
    deferManager.runDeferredActions();
    return result;
}
static PublicKey? recover(Uint8List signature, Uint8List message) {
    final deferManager = DeferManager();
    var signature0 = TWDataCreateWithNSData(signature);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(signature0);
    });
    var message0 = TWDataCreateWithNSData(message);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(message0);
    });
    var result = WalletCore.wcb.TWPublicKeyRecover(signature0,message0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return PublicKey(result);
}


bool get isCompressed {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWPublicKeyIsCompressed(rawValue);
    deferManager.runDeferredActions();
    return result;
}

PublicKey get compressed {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWPublicKeyCompressed(rawValue);
    deferManager.runDeferredActions();
    return PublicKey(result);
}

PublicKey get uncompressed {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWPublicKeyUncompressed(rawValue);
    deferManager.runDeferredActions();
    return PublicKey(result);
}

Uint8List get data {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWPublicKeyData(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

PublicKeyType get keyType {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWPublicKeyKeyType(rawValue);
    deferManager.runDeferredActions();
    return PublicKeyType.fromValue(result)!;
}

String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWPublicKeyDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
}
