part of 'generated.dart';
class TransactionUtil {
    TransactionUtil();




static String? calcTxHash(CoinType coinType, String encodedTx) {
    final deferManager = DeferManager();
    var coinType0 = coinType.value;
    var encodedTx0 = TWStringCreateWithNSString(encodedTx);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(encodedTx0);
    });
    var result = WalletCore.wcb.TWTransactionUtilCalcTxHash(coinType0,encodedTx0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
