part of 'generated.dart';
class WalletConnectRequest {
    final Pointer<TWWalletConnectRequest> rawValue;

    WalletConnectRequest(this.rawValue);




static Uint8List parse(CoinType coin, Uint8List input) {
    final deferManager = DeferManager();
    var coin0 = coin.value;
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWWalletConnectRequestParse(coin0,input0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
