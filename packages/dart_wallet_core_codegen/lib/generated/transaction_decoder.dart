part of 'generated.dart';
class TransactionDecoder {
    TransactionDecoder();




static Uint8List decode(CoinType coinType, Uint8List encodedTx) {
    final deferManager = DeferManager();
    var coinType0 = coinType.value;
    var encodedTx0 = TWDataCreateWithNSData(encodedTx);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(encodedTx0);
    });
    var result = WalletCore.wcb.TWTransactionDecoderDecode(coinType0,encodedTx0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
