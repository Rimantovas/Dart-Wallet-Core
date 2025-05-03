part of 'generated.dart';
class BitcoinMessageSigner {
    BitcoinMessageSigner();




static String signMessage(PrivateKey privateKey, String address, String message) {
    final deferManager = DeferManager();
    var privateKey0 = privateKey.rawValue;
    var address0 = TWStringCreateWithNSString(address);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(address0);
    });
    var message0 = TWStringCreateWithNSString(message);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(message0);
    });
    var result = WalletCore.wcb.TWBitcoinMessageSignerSignMessage(privateKey0,address0,message0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static bool verifyMessage(String address, String message, String signature) {
    final deferManager = DeferManager();
    var address0 = TWStringCreateWithNSString(address);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(address0);
    });
    var message0 = TWStringCreateWithNSString(message);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(message0);
    });
    var signature0 = TWStringCreateWithNSString(signature);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(signature0);
    });
    var result = WalletCore.wcb.TWBitcoinMessageSignerVerifyMessage(address0,message0,signature0);
    deferManager.runDeferredActions();
    return result;
}

}
