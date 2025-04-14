part of 'generated.dart';
class EthereumAbi {
    EthereumAbi();




static Uint8List encode(EthereumAbiFunction fn) {
    final deferManager = DeferManager();
    var fn0 = fn.rawValue;
    var result = WalletCore.wcb.TWEthereumAbiEncode(fn0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static bool decodeOutput(EthereumAbiFunction fn, Uint8List encoded) {
    final deferManager = DeferManager();
    var fn0 = fn.rawValue;
    var encoded0 = TWDataCreateWithNSData(encoded);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(encoded0);
    });
    var result = WalletCore.wcb.TWEthereumAbiDecodeOutput(fn0,encoded0);
    deferManager.runDeferredActions();
    return result;
}
static String? decodeCall(Uint8List data, String abi) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var abi0 = TWStringCreateWithNSString(abi);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(abi0);
    });
    var result = WalletCore.wcb.TWEthereumAbiDecodeCall(data0,abi0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static Uint8List encodeTyped(String messageJson) {
    final deferManager = DeferManager();
    var messageJson0 = TWStringCreateWithNSString(messageJson);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(messageJson0);
    });
    var result = WalletCore.wcb.TWEthereumAbiEncodeTyped(messageJson0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static String? getFunctionSignature(String abi) {
    final deferManager = DeferManager();
    var abi0 = TWStringCreateWithNSString(abi);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(abi0);
    });
    var result = WalletCore.wcb.TWEthereumAbiGetFunctionSignature(abi0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
