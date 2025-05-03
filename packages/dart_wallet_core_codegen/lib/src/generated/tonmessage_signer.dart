part of 'generated.dart';
class TONMessageSigner {
    TONMessageSigner();




static String? signMessage(PrivateKey privateKey, String message) {
    final deferManager = DeferManager();
    var privateKey0 = privateKey.rawValue;
    var message0 = TWStringCreateWithNSString(message);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(message0);
    });
    var result = WalletCore.wcb.TWTONMessageSignerSignMessage(privateKey0,message0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
