part of 'generated.dart';
class CoinTypeConfiguration {
    CoinTypeConfiguration();




static String getSymbol(CoinType type) {
    final deferManager = DeferManager();
    var type0 = type.value;
    var result = WalletCore.wcb.TWCoinTypeConfigurationGetSymbol(type0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static int getDecimals(CoinType type) {
    final deferManager = DeferManager();
    var type0 = type.value;
    var result = WalletCore.wcb.TWCoinTypeConfigurationGetDecimals(type0);
    deferManager.runDeferredActions();
    return result;
}
static String getTransactionUrl(CoinType type, String transactionID) {
    final deferManager = DeferManager();
    var type0 = type.value;
    var transactionID0 = TWStringCreateWithNSString(transactionID);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(transactionID0);
    });
    var result = WalletCore.wcb.TWCoinTypeConfigurationGetTransactionURL(type0,transactionID0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String getAccountUrl(CoinType type, String accountID) {
    final deferManager = DeferManager();
    var type0 = type.value;
    var accountID0 = TWStringCreateWithNSString(accountID);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(accountID0);
    });
    var result = WalletCore.wcb.TWCoinTypeConfigurationGetAccountURL(type0,accountID0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String getId(CoinType type) {
    final deferManager = DeferManager();
    var type0 = type.value;
    var result = WalletCore.wcb.TWCoinTypeConfigurationGetID(type0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String getName(CoinType type) {
    final deferManager = DeferManager();
    var type0 = type.value;
    var result = WalletCore.wcb.TWCoinTypeConfigurationGetName(type0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
