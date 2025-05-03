part of 'generated.dart';
class NEARAccount {
    final Pointer<TWNEARAccount> rawValue;

    NEARAccount(this.rawValue);


static NEARAccount? createWithString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWNEARAccountCreateWithString(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return NEARAccount(result);
}

    void deinit() {
        WalletCore.wcb.TWNEARAccountDelete(rawValue);
    }



String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWNEARAccountDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
}
