part of 'generated.dart';
class CryptoBox {
    CryptoBox();




static Uint8List encryptEasy(CryptoBoxSecretKey mySecret, CryptoBoxPublicKey otherPubkey, Uint8List message) {
    final deferManager = DeferManager();
    var mySecret0 = mySecret.rawValue;
    var otherPubkey0 = otherPubkey.rawValue;
    var message0 = TWDataCreateWithNSData(message);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(message0);
    });
    var result = WalletCore.wcb.TWCryptoBoxEncryptEasy(mySecret0,otherPubkey0,message0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List? decryptEasy(CryptoBoxSecretKey mySecret, CryptoBoxPublicKey otherPubkey, Uint8List encrypted) {
    final deferManager = DeferManager();
    var mySecret0 = mySecret.rawValue;
    var otherPubkey0 = otherPubkey.rawValue;
    var encrypted0 = TWDataCreateWithNSData(encrypted);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(encrypted0);
    });
    var result = WalletCore.wcb.TWCryptoBoxDecryptEasy(mySecret0,otherPubkey0,encrypted0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
