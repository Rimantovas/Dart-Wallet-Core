part of 'generated.dart';
class THORChainSwap {
    THORChainSwap();




static Uint8List buildSwap(Uint8List input) {
    final deferManager = DeferManager();
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWTHORChainSwapBuildSwap(input0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
