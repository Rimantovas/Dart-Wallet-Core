part of 'generated.dart';
class Cardano {
    Cardano();




static int minAdaAmount(Uint8List tokenBundle) {
    final deferManager = DeferManager();
    var tokenBundle0 = TWDataCreateWithNSData(tokenBundle);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(tokenBundle0);
    });
    var result = WalletCore.wcb.TWCardanoMinAdaAmount(tokenBundle0);
    deferManager.runDeferredActions();
    return result;
}
static String? outputMinAdaAmount(String toAddress, Uint8List tokenBundle, String coinsPerUtxoByte) {
    final deferManager = DeferManager();
    var toAddress0 = TWStringCreateWithNSString(toAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(toAddress0);
    });
    var tokenBundle0 = TWDataCreateWithNSData(tokenBundle);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(tokenBundle0);
    });
    var coinsPerUtxoByte0 = TWStringCreateWithNSString(coinsPerUtxoByte);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(coinsPerUtxoByte0);
    });
    var result = WalletCore.wcb.TWCardanoOutputMinAdaAmount(toAddress0,tokenBundle0,coinsPerUtxoByte0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String getStakingAddress(String baseAddress) {
    final deferManager = DeferManager();
    var baseAddress0 = TWStringCreateWithNSString(baseAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(baseAddress0);
    });
    var result = WalletCore.wcb.TWCardanoGetStakingAddress(baseAddress0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String getByronAddress(PublicKey publicKey) {
    final deferManager = DeferManager();
    var publicKey0 = publicKey.rawValue;
    var result = WalletCore.wcb.TWCardanoGetByronAddress(publicKey0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
