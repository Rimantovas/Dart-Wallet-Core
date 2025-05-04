part of 'generated.dart';
class TONWallet {
    final Pointer<TWTONWallet> rawValue;

    TONWallet(this.rawValue);




static String? buildV4r2StateInit(PublicKey publicKey, int workchain, int walletId) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var result = WalletCore.wcb.TWTONWalletBuildV4R2StateInit(publicKey0,workchain,walletId);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String? buildV5r1StateInit(PublicKey publicKey, int workchain, int walletId) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var result = WalletCore.wcb.TWTONWalletBuildV5R1StateInit(publicKey0,workchain,walletId);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
