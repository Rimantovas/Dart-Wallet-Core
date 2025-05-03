part of 'generated.dart';
class CryptoBoxPublicKey {
    final Pointer<TWCryptoBoxPublicKey> rawValue;

    CryptoBoxPublicKey(this.rawValue);


static CryptoBoxPublicKey? createWithData(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWCryptoBoxPublicKeyCreateWithData(data0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return CryptoBoxPublicKey(result);
}

    void deinit() {
        WalletCore.wcb.TWCryptoBoxPublicKeyDelete(rawValue);
    }

static bool isValid(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWCryptoBoxPublicKeyIsValid(data0);
    deferManager.runDeferredActions();
    return result;
}


Uint8List get data {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWCryptoBoxPublicKeyData(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
}
