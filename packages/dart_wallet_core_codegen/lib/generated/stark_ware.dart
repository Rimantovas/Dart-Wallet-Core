part of 'generated.dart';
class StarkWare {
    StarkWare();




static PrivateKey getStarkKeyFromSignature(DerivationPath derivationPath, String signature) {
    final deferManager = DeferManager();
    var derivationPath0 = derivationPath.rawValue;
    var signature0 = TWStringCreateWithNSString(signature);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(signature0);
    });
    var result = WalletCore.wcb.TWStarkWareGetStarkKeyFromSignature(derivationPath0,signature0);
    deferManager.runDeferredActions();
    return PrivateKey(result);
}

}
