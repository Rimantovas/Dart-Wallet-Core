part of 'generated.dart';
class EthereumMessageSigner {
    EthereumMessageSigner();




static String signTypedMessage(PrivateKey privateKey, String messageJson) {
    final deferManager = DeferManager();
    var privateKey0 = privateKey.rawValue;
    var messageJson0 = TWStringCreateWithNSString(messageJson);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(messageJson0);
    });
    var result = WalletCore.wcb.TWEthereumMessageSignerSignTypedMessage(privateKey0,messageJson0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String signTypedMessageEip155(PrivateKey privateKey, String messageJson, int chainId) {
    final deferManager = DeferManager();
    var privateKey0 = privateKey.rawValue;
    var messageJson0 = TWStringCreateWithNSString(messageJson);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(messageJson0);
    });
    var result = WalletCore.wcb.TWEthereumMessageSignerSignTypedMessageEip155(privateKey0,messageJson0,chainId);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String signMessage(PrivateKey privateKey, String message) {
    final deferManager = DeferManager();
    var privateKey0 = privateKey.rawValue;
    var message0 = TWStringCreateWithNSString(message);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(message0);
    });
    var result = WalletCore.wcb.TWEthereumMessageSignerSignMessage(privateKey0,message0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String signMessageImmutableX(PrivateKey privateKey, String message) {
    final deferManager = DeferManager();
    var privateKey0 = privateKey.rawValue;
    var message0 = TWStringCreateWithNSString(message);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(message0);
    });
    var result = WalletCore.wcb.TWEthereumMessageSignerSignMessageImmutableX(privateKey0,message0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String signMessageEip155(PrivateKey privateKey, String message, int chainId) {
    final deferManager = DeferManager();
    var privateKey0 = privateKey.rawValue;
    var message0 = TWStringCreateWithNSString(message);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(message0);
    });
    var result = WalletCore.wcb.TWEthereumMessageSignerSignMessageEip155(privateKey0,message0,chainId);
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
    var result = WalletCore.wcb.TWEthereumMessageSignerVerifyMessage(pubKey0,message0,signature0);
    deferManager.runDeferredActions();
    return result;
}

}
