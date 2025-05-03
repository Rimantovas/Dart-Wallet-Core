part of 'generated.dart';
class PBKDF2 {
    PBKDF2();




static Uint8List? hmacSha256(Uint8List password, Uint8List salt, int iterations, int dkLen) {
    final deferManager = DeferManager();
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var salt0 = TWDataCreateWithNSData(salt);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(salt0);
    });
    var result = WalletCore.wcb.TWPBKDF2HmacSha256(password0,salt0,iterations,dkLen);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List? hmacSha512(Uint8List password, Uint8List salt, int iterations, int dkLen) {
    final deferManager = DeferManager();
    var password0 = TWDataCreateWithNSData(password);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(password0);
    });
    var salt0 = TWDataCreateWithNSData(salt);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(salt0);
    });
    var result = WalletCore.wcb.TWPBKDF2HmacSha512(password0,salt0,iterations,dkLen);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
