part of 'generated.dart';
class AsnParser {
    AsnParser();




static Uint8List? ecdsaSignatureFromDer(Uint8List encoded) {
    final deferManager = DeferManager();
    var encoded0 = TWDataCreateWithNSData(encoded);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(encoded0);
    });
    var result = WalletCore.wcb.TWAsnParserEcdsaSignatureFromDer(encoded0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
