part of 'generated.dart';
class AES {
    AES();




static Uint8List? encryptCBC(Uint8List key, Uint8List data, Uint8List iv, AESPaddingMode mode) {
    final deferManager = DeferManager();
    var key0 = TWDataCreateWithNSData(key);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(key0);
    });
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var iv0 = TWDataCreateWithNSData(iv);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(iv0);
    });
    var mode0 = mode.value;
    var result = WalletCore.wcb.TWAESEncryptCBC(key0,data0,iv0,mode0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List? decryptCBC(Uint8List key, Uint8List data, Uint8List iv, AESPaddingMode mode) {
    final deferManager = DeferManager();
    var key0 = TWDataCreateWithNSData(key);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(key0);
    });
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var iv0 = TWDataCreateWithNSData(iv);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(iv0);
    });
    var mode0 = mode.value;
    var result = WalletCore.wcb.TWAESDecryptCBC(key0,data0,iv0,mode0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List? encryptCTR(Uint8List key, Uint8List data, Uint8List iv) {
    final deferManager = DeferManager();
    var key0 = TWDataCreateWithNSData(key);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(key0);
    });
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var iv0 = TWDataCreateWithNSData(iv);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(iv0);
    });
    var result = WalletCore.wcb.TWAESEncryptCTR(key0,data0,iv0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List? decryptCTR(Uint8List key, Uint8List data, Uint8List iv) {
    final deferManager = DeferManager();
    var key0 = TWDataCreateWithNSData(key);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(key0);
    });
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var iv0 = TWDataCreateWithNSData(iv);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(iv0);
    });
    var result = WalletCore.wcb.TWAESDecryptCTR(key0,data0,iv0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
