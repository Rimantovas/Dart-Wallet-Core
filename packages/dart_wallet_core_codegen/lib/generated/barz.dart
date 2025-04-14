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

}
