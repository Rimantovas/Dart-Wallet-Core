part of 'generated.dart';
class DataVector {
    final Pointer<TWDataVector> rawValue;

    DataVector(this.rawValue);


static DataVector create() {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDataVectorCreate();

    deferManager.runDeferredActions();
    return DataVector(result);
}
static DataVector createWithData(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWDataVectorCreateWithData(data0);

    deferManager.runDeferredActions();
    return DataVector(result);
}

    void deinit() {
        WalletCore.wcb.TWDataVectorDelete(rawValue);
    }

void add(Uint8List data) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWDataVectorAdd(obj,data0);
    deferManager.runDeferredActions();
    return result;
}
Uint8List? get(int index) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWDataVectorGet(obj,index);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}


int get size {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDataVectorSize(rawValue);
    deferManager.runDeferredActions();
    return result;
}
}
