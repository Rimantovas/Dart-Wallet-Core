part of 'generated.dart';
class SolanaTransaction {
    final Pointer<TWSolanaTransaction> rawValue;

    SolanaTransaction(this.rawValue);




static Uint8List? updateBlockhashAndSign(String encodedTx, String recentBlockhash, DataVector privateKeys) {
    final deferManager = DeferManager();
    var encodedTx0 = TWStringCreateWithNSString(encodedTx);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(encodedTx0);
    });
    var recentBlockhash0 = TWStringCreateWithNSString(recentBlockhash);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(recentBlockhash0);
    });
    var privateKeys0 = privateKeys.rawValue;
    var result = WalletCore.wcb.TWSolanaTransactionUpdateBlockhashAndSign(encodedTx0,recentBlockhash0,privateKeys0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static String? getComputeUnitPrice(String encodedTx) {
    final deferManager = DeferManager();
    var encodedTx0 = TWStringCreateWithNSString(encodedTx);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(encodedTx0);
    });
    var result = WalletCore.wcb.TWSolanaTransactionGetComputeUnitPrice(encodedTx0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String? getComputeUnitLimit(String encodedTx) {
    final deferManager = DeferManager();
    var encodedTx0 = TWStringCreateWithNSString(encodedTx);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(encodedTx0);
    });
    var result = WalletCore.wcb.TWSolanaTransactionGetComputeUnitLimit(encodedTx0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String? setComputeUnitPrice(String encodedTx, String price) {
    final deferManager = DeferManager();
    var encodedTx0 = TWStringCreateWithNSString(encodedTx);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(encodedTx0);
    });
    var price0 = TWStringCreateWithNSString(price);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(price0);
    });
    var result = WalletCore.wcb.TWSolanaTransactionSetComputeUnitPrice(encodedTx0,price0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String? setComputeUnitLimit(String encodedTx, String limit) {
    final deferManager = DeferManager();
    var encodedTx0 = TWStringCreateWithNSString(encodedTx);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(encodedTx0);
    });
    var limit0 = TWStringCreateWithNSString(limit);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(limit0);
    });
    var result = WalletCore.wcb.TWSolanaTransactionSetComputeUnitLimit(encodedTx0,limit0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String? setFeePayer(String encodedTx, String feePayer) {
    final deferManager = DeferManager();
    var encodedTx0 = TWStringCreateWithNSString(encodedTx);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(encodedTx0);
    });
    var feePayer0 = TWStringCreateWithNSString(feePayer);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(feePayer0);
    });
    var result = WalletCore.wcb.TWSolanaTransactionSetFeePayer(encodedTx0,feePayer0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
