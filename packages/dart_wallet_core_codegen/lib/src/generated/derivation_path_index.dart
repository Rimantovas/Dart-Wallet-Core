part of 'generated.dart';
class DerivationPathIndex {
    final Pointer<TWDerivationPathIndex> rawValue;

    DerivationPathIndex(this.rawValue);


static DerivationPathIndex create(int value, bool hardened) {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathIndexCreate(value,hardened);

    deferManager.runDeferredActions();
    return DerivationPathIndex(result);
}

    void deinit() {
        WalletCore.wcb.TWDerivationPathIndexDelete(rawValue);
    }



int get value {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathIndexValue(rawValue);
    deferManager.runDeferredActions();
    return result;
}

bool get hardened {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathIndexHardened(rawValue);
    deferManager.runDeferredActions();
    return result;
}

String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWDerivationPathIndexDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
}
