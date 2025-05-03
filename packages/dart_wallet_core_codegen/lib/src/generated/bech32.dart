part of 'generated.dart';
class Bech32 {
    Bech32();




static String encode(String hrp, Uint8List data) {
    final deferManager = DeferManager();
    var hrp0 = TWStringCreateWithNSString(hrp);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(hrp0);
    });
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWBech32Encode(hrp0,data0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static Uint8List? decode(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWBech32Decode(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static String encodeM(String hrp, Uint8List data) {
    final deferManager = DeferManager();
    var hrp0 = TWStringCreateWithNSString(hrp);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(hrp0);
    });
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWBech32EncodeM(hrp0,data0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static Uint8List? decodeM(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWBech32DecodeM(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
