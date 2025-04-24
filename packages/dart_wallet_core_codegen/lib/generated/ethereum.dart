part of 'generated.dart';
class Ethereum {
    Ethereum();




static String eip2645GetPath(String ethAddress, String layer, String application, String index) {
    final deferManager = DeferManager();
    var ethAddress0 = TWStringCreateWithNSString(ethAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(ethAddress0);
    });
    var layer0 = TWStringCreateWithNSString(layer);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(layer0);
    });
    var application0 = TWStringCreateWithNSString(application);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(application0);
    });
    var index0 = TWStringCreateWithNSString(index);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(index0);
    });
    var result = WalletCore.wcb.TWEthereumEip2645GetPath(ethAddress0,layer0,application0,index0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
