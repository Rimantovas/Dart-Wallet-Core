part of 'generated.dart';
class CryptoBoxSecretKey {
    final Pointer<TWCryptoBoxSecretKey> rawValue;

    CryptoBoxSecretKey(this.rawValue);


static CryptoBoxSecretKey create() {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCryptoBoxSecretKeyCreate();

    deferManager.runDeferredActions();
    return CryptoBoxSecretKey(result);
}
static CryptoBoxSecretKey? createWithData(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWCryptoBoxSecretKeyCreateWithData(data0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return CryptoBoxSecretKey(result);
}

    void deinit() {
        WalletCore.wcb.TWCryptoBoxSecretKeyDelete(rawValue);
    }

static bool isValid(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWCryptoBoxSecretKeyIsValid(data0);
    deferManager.runDeferredActions();
    return result;
}
CryptoBoxPublicKey getPublicKey() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWCryptoBoxSecretKeyGetPublicKey(obj);
    deferManager.runDeferredActions();
    return CryptoBoxPublicKey(result);
}


Uint8List get data {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCryptoBoxSecretKeyData(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
}
