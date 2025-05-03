part of 'generated.dart';
class EthereumAbiValue {
    EthereumAbiValue();




static Uint8List encodeBool(bool value) {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWEthereumAbiValueEncodeBool(value);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List encodeInt32(int value) {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWEthereumAbiValueEncodeInt32(value);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List encodeUInt32(int value) {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWEthereumAbiValueEncodeUInt32(value);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List encodeInt256(Uint8List value) {
    final deferManager = DeferManager();
    var value0 = TWDataCreateWithNSData(value);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(value0);
    });
    var result = WalletCore.wcb.TWEthereumAbiValueEncodeInt256(value0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List encodeUInt256(Uint8List value) {
    final deferManager = DeferManager();
    var value0 = TWDataCreateWithNSData(value);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(value0);
    });
    var result = WalletCore.wcb.TWEthereumAbiValueEncodeUInt256(value0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List encodeAddress(Uint8List value) {
    final deferManager = DeferManager();
    var value0 = TWDataCreateWithNSData(value);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(value0);
    });
    var result = WalletCore.wcb.TWEthereumAbiValueEncodeAddress(value0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List encodeString(String value) {
    final deferManager = DeferManager();
    var value0 = TWStringCreateWithNSString(value);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(value0);
    });
    var result = WalletCore.wcb.TWEthereumAbiValueEncodeString(value0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List encodeBytes(Uint8List value) {
    final deferManager = DeferManager();
    var value0 = TWDataCreateWithNSData(value);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(value0);
    });
    var result = WalletCore.wcb.TWEthereumAbiValueEncodeBytes(value0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List encodeBytesDyn(Uint8List value) {
    final deferManager = DeferManager();
    var value0 = TWDataCreateWithNSData(value);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(value0);
    });
    var result = WalletCore.wcb.TWEthereumAbiValueEncodeBytesDyn(value0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static String decodeUInt256(Uint8List input) {
    final deferManager = DeferManager();
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var result = WalletCore.wcb.TWEthereumAbiValueDecodeUInt256(input0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String decodeValue(Uint8List input, String type) {
    final deferManager = DeferManager();
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var type0 = TWStringCreateWithNSString(type);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(type0);
    });
    var result = WalletCore.wcb.TWEthereumAbiValueDecodeValue(input0,type0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String decodeArray(Uint8List input, String type) {
    final deferManager = DeferManager();
    var input0 = TWDataCreateWithNSData(input);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(input0);
    });
    var type0 = TWStringCreateWithNSString(type);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(type0);
    });
    var result = WalletCore.wcb.TWEthereumAbiValueDecodeArray(input0,type0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
