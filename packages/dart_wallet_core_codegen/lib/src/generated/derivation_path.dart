part of 'generated.dart';
class DerivationPath {
    final Pointer<TWDerivationPath> rawValue;

    DerivationPath(this.rawValue);


static DerivationPath create(Purpose purpose, int coin, int account, int change, int address) {
    final deferManager = DeferManager();
    var purpose0 = purpose.value;
    var result = WalletCore.wcb.TWDerivationPathCreate(purpose0,coin,account,change,address);

    deferManager.runDeferredActions();
    return DerivationPath(result);
}
static DerivationPath? createWithString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWDerivationPathCreateWithString(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return DerivationPath(result);
}

    void deinit() {
        WalletCore.wcb.TWDerivationPathDelete(rawValue);
    }

DerivationPathIndex? indexAt(int index) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWDerivationPathIndexAt(obj,index);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return DerivationPathIndex(result);
}
int indicesCount() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWDerivationPathIndicesCount(obj);
    deferManager.runDeferredActions();
    return result;
}


Purpose get purpose {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathPurpose(rawValue);
    deferManager.runDeferredActions();
    return Purpose.fromValue(result)!;
}

int get coin {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathCoin(rawValue);
    deferManager.runDeferredActions();
    return result;
}

int get account {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathAccount(rawValue);
    deferManager.runDeferredActions();
    return result;
}

int get change {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathChange(rawValue);
    deferManager.runDeferredActions();
    return result;
}

int get address {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathAddress(rawValue);
    deferManager.runDeferredActions();
    return result;
}

String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
}
