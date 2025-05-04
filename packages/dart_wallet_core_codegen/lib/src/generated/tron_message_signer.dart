part of 'generated.dart';
class TronMessageSigner {
    TronMessageSigner();




static String signMessage(PrivateKey privateKey, String message) {
    final deferManager = DeferManager();
    var privateKey0 = privateKey.rawValue;
    var message0 = TWStringCreateWithNSString(message);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(message0);
    });
    var result = WalletCore.wcb.TWTronMessageSignerSignMessage(privateKey0,message0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static bool verifyMessage(PublicKey pubKey, String message, String signature) {
    final deferManager = DeferManager();
    var pubKey0 = pubKey.rawValue;
    var message0 = TWStringCreateWithNSString(message);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(message0);
    });
    var signature0 = TWStringCreateWithNSString(signature);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(signature0);
    });
    var result = WalletCore.wcb.TWTronMessageSignerVerifyMessage(pubKey0,message0,signature0);
    deferManager.runDeferredActions();
    return result;
}

}
