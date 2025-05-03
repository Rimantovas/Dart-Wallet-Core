part of 'generated.dart';
class Barz {
    Barz();




static String getCounterfactualAddress(Uint8List input) {
    final deferManager = DeferManager();
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWBarzGetCounterfactualAddress(input0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static Uint8List getInitCode(String factory, PublicKey publicKey, String verificationFacet, int salt) {
    final deferManager = DeferManager();
    var factory0 = TWStringCreateWithNSString(factory);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(factory0);
    });
    var publicKey0 = publicKey.rawValue;
    var verificationFacet0 = TWStringCreateWithNSString(verificationFacet);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(verificationFacet0);
    });
    var result = WalletCore.wcb.TWBarzGetInitCode(factory0,publicKey0,verificationFacet0,salt);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List getFormattedSignature(Uint8List signature, Uint8List challenge, Uint8List authenticatorData, String clientDataJSON) {
    final deferManager = DeferManager();
    var signature0 = TWDataCreateWithNSData(signature);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(signature0);
    });
    var challenge0 = TWDataCreateWithNSData(challenge);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(challenge0);
    });
    var authenticatorData0 = TWDataCreateWithNSData(authenticatorData);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(authenticatorData0);
    });
    var clientDataJSON0 = TWStringCreateWithNSString(clientDataJSON);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(clientDataJSON0);
    });
    var result = WalletCore.wcb.TWBarzGetFormattedSignature(signature0,challenge0,authenticatorData0,clientDataJSON0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List getPrefixedMsgHash(Uint8List msgHash, String barzAddress, int chainId) {
    final deferManager = DeferManager();
    var msgHash0 = TWDataCreateWithNSData(msgHash);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(msgHash0);
    });
    var barzAddress0 = TWStringCreateWithNSString(barzAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(barzAddress0);
    });
    var result = WalletCore.wcb.TWBarzGetPrefixedMsgHash(msgHash0,barzAddress0,chainId);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List getDiamondCutCode(Uint8List input) {
    final deferManager = DeferManager();
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWBarzGetDiamondCutCode(input0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List getAuthorizationHash(Uint8List chainId, String contractAddress, Uint8List nonce) {
    final deferManager = DeferManager();
    var chainId0 = TWDataCreateWithNSData(chainId);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(chainId0);
    });
    var contractAddress0 = TWStringCreateWithNSString(contractAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(contractAddress0);
    });
    var nonce0 = TWDataCreateWithNSData(nonce);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(nonce0);
    });
    var result = WalletCore.wcb.TWBarzGetAuthorizationHash(chainId0,contractAddress0,nonce0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static String signAuthorization(Uint8List chainId, String contractAddress, Uint8List nonce, String privateKey) {
    final deferManager = DeferManager();
    var chainId0 = TWDataCreateWithNSData(chainId);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(chainId0);
    });
    var contractAddress0 = TWStringCreateWithNSString(contractAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(contractAddress0);
    });
    var nonce0 = TWDataCreateWithNSData(nonce);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(nonce0);
    });
    var privateKey0 = TWStringCreateWithNSString(privateKey);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(privateKey0);
    });
    var result = WalletCore.wcb.TWBarzSignAuthorization(chainId0,contractAddress0,nonce0,privateKey0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static Uint8List getEncodedHash(Uint8List chainId, String codeAddress, String codeName, String codeVersion, String typeHash, String domainSeparatorHash, String sender, String userOpHash) {
    final deferManager = DeferManager();
    var chainId0 = TWDataCreateWithNSData(chainId);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(chainId0);
    });
    var codeAddress0 = TWStringCreateWithNSString(codeAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(codeAddress0);
    });
    var codeName0 = TWStringCreateWithNSString(codeName);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(codeName0);
    });
    var codeVersion0 = TWStringCreateWithNSString(codeVersion);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(codeVersion0);
    });
    var typeHash0 = TWStringCreateWithNSString(typeHash);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(typeHash0);
    });
    var domainSeparatorHash0 = TWStringCreateWithNSString(domainSeparatorHash);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(domainSeparatorHash0);
    });
    var sender0 = TWStringCreateWithNSString(sender);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(sender0);
    });
    var userOpHash0 = TWStringCreateWithNSString(userOpHash);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(userOpHash0);
    });
    var result = WalletCore.wcb.TWBarzGetEncodedHash(chainId0,codeAddress0,codeName0,codeVersion0,typeHash0,domainSeparatorHash0,sender0,userOpHash0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List getSignedHash(String hash, String privateKey) {
    final deferManager = DeferManager();
    var hash0 = TWStringCreateWithNSString(hash);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(hash0);
    });
    var privateKey0 = TWStringCreateWithNSString(privateKey);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(privateKey0);
    });
    var result = WalletCore.wcb.TWBarzGetSignedHash(hash0,privateKey0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
