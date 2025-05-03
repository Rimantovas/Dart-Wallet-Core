part of 'generated.dart';
class EthereumAbiFunction {
    final Pointer<TWEthereumAbiFunction> rawValue;

    EthereumAbiFunction(this.rawValue);


static EthereumAbiFunction createWithString(String name) {
    final deferManager = DeferManager();
    var name0 = TWStringCreateWithNSString(name);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(name0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionCreateWithString(name0);

    deferManager.runDeferredActions();
    return EthereumAbiFunction(result);
}

    void deinit() {
        WalletCore.wcb.TWEthereumAbiFunctionDelete(rawValue);
    }

String getType() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionGetType(obj);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
int addParamUInt8(int val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamUInt8(obj,val,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamUInt16(int val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamUInt16(obj,val,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamUInt32(int val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamUInt32(obj,val,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamUInt64(int val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamUInt64(obj,val,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamUInt256(Uint8List val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamUInt256(obj,val0,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamUIntN(int bits, Uint8List val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamUIntN(obj,bits,val0,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamInt8(int val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamInt8(obj,val,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamInt16(int val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamInt16(obj,val,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamInt32(int val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamInt32(obj,val,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamInt64(int val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamInt64(obj,val,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamInt256(Uint8List val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamInt256(obj,val0,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamIntN(int bits, Uint8List val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamIntN(obj,bits,val0,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamBool(bool val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamBool(obj,val,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamString(String val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWStringCreateWithNSString(val);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamString(obj,val0,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamAddress(Uint8List val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamAddress(obj,val0,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamBytes(Uint8List val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamBytes(obj,val0,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamBytesFix(int size, Uint8List val, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamBytesFix(obj,size,val0,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int addParamArray(bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddParamArray(obj,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int getParamUInt8(int idx, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionGetParamUInt8(obj,idx,isOutput);
    deferManager.runDeferredActions();
    return result;
}
int getParamUInt64(int idx, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionGetParamUInt64(obj,idx,isOutput);
    deferManager.runDeferredActions();
    return result;
}
Uint8List getParamUInt256(int idx, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionGetParamUInt256(obj,idx,isOutput);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
bool getParamBool(int idx, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionGetParamBool(obj,idx,isOutput);
    deferManager.runDeferredActions();
    return result;
}
String getParamString(int idx, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionGetParamString(obj,idx,isOutput);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
Uint8List getParamAddress(int idx, bool isOutput) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionGetParamAddress(obj,idx,isOutput);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
int addInArrayParamUInt8(int arrayIdx, int val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamUInt8(obj,arrayIdx,val);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamUInt16(int arrayIdx, int val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamUInt16(obj,arrayIdx,val);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamUInt32(int arrayIdx, int val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamUInt32(obj,arrayIdx,val);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamUInt64(int arrayIdx, int val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamUInt64(obj,arrayIdx,val);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamUInt256(int arrayIdx, Uint8List val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamUInt256(obj,arrayIdx,val0);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamUIntN(int arrayIdx, int bits, Uint8List val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamUIntN(obj,arrayIdx,bits,val0);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamInt8(int arrayIdx, int val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamInt8(obj,arrayIdx,val);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamInt16(int arrayIdx, int val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamInt16(obj,arrayIdx,val);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamInt32(int arrayIdx, int val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamInt32(obj,arrayIdx,val);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamInt64(int arrayIdx, int val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamInt64(obj,arrayIdx,val);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamInt256(int arrayIdx, Uint8List val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamInt256(obj,arrayIdx,val0);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamIntN(int arrayIdx, int bits, Uint8List val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamIntN(obj,arrayIdx,bits,val0);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamBool(int arrayIdx, bool val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamBool(obj,arrayIdx,val);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamString(int arrayIdx, String val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWStringCreateWithNSString(val);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamString(obj,arrayIdx,val0);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamAddress(int arrayIdx, Uint8List val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamAddress(obj,arrayIdx,val0);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamBytes(int arrayIdx, Uint8List val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamBytes(obj,arrayIdx,val0);
    deferManager.runDeferredActions();
    return result;
}
int addInArrayParamBytesFix(int arrayIdx, int size, Uint8List val) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var val0 = TWDataCreateWithNSData(val);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(val0);
    });
    var result = WalletCore.wcb.TWEthereumAbiFunctionAddInArrayParamBytesFix(obj,arrayIdx,size,val0);
    deferManager.runDeferredActions();
    return result;
}

}
