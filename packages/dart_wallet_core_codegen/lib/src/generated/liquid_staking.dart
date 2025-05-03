part of 'generated.dart';
class LiquidStaking {
    LiquidStaking();




static Uint8List buildRequest(Uint8List input) {
    final deferManager = DeferManager();
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWLiquidStakingBuildRequest(input0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
