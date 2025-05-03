part of 'generated.dart';
class EthereumRlp {
    EthereumRlp();




static Uint8List encode(CoinType coin, Uint8List input) {
    final deferManager = DeferManager();
    var coin0 = coin.value;
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWEthereumRlpEncode(coin0,input0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
