part of 'generated.dart';
class MessageSigner {
    MessageSigner();




static Uint8List? sign(CoinType coin, Uint8List input) {
    final deferManager = DeferManager();
    var coin0 = coin.value;
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWMessageSignerSign(coin0,input0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static bool verify(CoinType coin, Uint8List input) {
    final deferManager = DeferManager();
    var coin0 = coin.value;
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWMessageSignerVerify(coin0,input0);
    deferManager.runDeferredActions();
    return result;
}
static Uint8List? preImageHashes(CoinType coin, Uint8List input) {
    final deferManager = DeferManager();
    var coin0 = coin.value;
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWMessageSignerPreImageHashes(coin0,input0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
