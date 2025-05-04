part of 'generated.dart';
class FIOAccount {
    final Pointer<TWFIOAccount> rawValue;

    FIOAccount(this.rawValue);


static FIOAccount? createWithString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWFIOAccountCreateWithString(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return FIOAccount(result);
}

    void deinit() {
        WalletCore.wcb.TWFIOAccountDelete(rawValue);
    }



String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWFIOAccountDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
}
