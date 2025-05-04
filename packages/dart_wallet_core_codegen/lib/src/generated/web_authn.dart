part of 'generated.dart';
class WebAuthn {
    WebAuthn();




static PublicKey? getPublicKey(Uint8List attestationObject) {
    final deferManager = DeferManager();
    var attestationObject0 = TWDataCreateWithNSData(attestationObject);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(attestationObject0);
    });
    var result = WalletCore.wcb.TWWebAuthnGetPublicKey(attestationObject0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return PublicKey(result);
}
static Uint8List getRsValues(Uint8List signature) {
    final deferManager = DeferManager();
    var signature0 = TWDataCreateWithNSData(signature);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(signature0);
    });
    var result = WalletCore.wcb.TWWebAuthnGetRSValues(signature0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List reconstructOriginalMessage(Uint8List authenticatorData, Uint8List clientDataJSON) {
    final deferManager = DeferManager();
    var authenticatorData0 = TWDataCreateWithNSData(authenticatorData);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(authenticatorData0);
    });
    var clientDataJSON0 = TWDataCreateWithNSData(clientDataJSON);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(clientDataJSON0);
    });
    var result = WalletCore.wcb.TWWebAuthnReconstructOriginalMessage(authenticatorData0,clientDataJSON0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
