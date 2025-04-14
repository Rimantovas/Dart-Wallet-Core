part of 'generated.dart';

class Ethereum {
  Ethereum();

  static String eip2645GetPath(
      String ethAddress, String layer, String application, String index) {
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
    var result = WalletCore.wcb
        .TWEthereumEip2645GetPath(ethAddress0, layer0, application0, index0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
  }
// static String eip4337GetDeploymentAddress(String factoryAddress, String logicAddress, String ownerAddress) {
//     final deferManager = DeferManager();
//     var factoryAddress0 = TWStringCreateWithNSString(factoryAddress);
//     deferManager.defer(() {
//         WalletCore.wcb.TWStringDelete(factoryAddress0);
//     });
//     var logicAddress0 = TWStringCreateWithNSString(logicAddress);
//     deferManager.defer(() {
//         WalletCore.wcb.TWStringDelete(logicAddress0);
//     });
//     var ownerAddress0 = TWStringCreateWithNSString(ownerAddress);
//     deferManager.defer(() {
//         WalletCore.wcb.TWStringDelete(ownerAddress0);
//     });
//     var result = WalletCore.wcb.TWEthereumEip4337GetDeploymentAddress(factoryAddress0,logicAddress0,ownerAddress0);
//     deferManager.runDeferredActions();
//     return TWStringNSString(result);
// }
}
