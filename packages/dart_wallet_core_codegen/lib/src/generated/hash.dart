part of 'generated.dart';
class Hash {
    Hash();




static Uint8List sha1(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashSHA1(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List sha256(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashSHA256(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List sha512(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashSHA512(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List sha512_256(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashSHA512_256(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List keccak256(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashKeccak256(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List keccak512(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashKeccak512(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List sha3_256(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashSHA3_256(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List sha3512(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashSHA3_512(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List RIPEMD(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashRIPEMD(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List blake256(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashBlake256(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List blake2b(Uint8List data, int size) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashBlake2b(data0,size);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List blake2bPersonal(Uint8List data, Uint8List personal, int outlen) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var personal0 = TWDataCreateWithNSData(personal);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(personal0);
    });
    var result = WalletCore.wcb.TWHashBlake2bPersonal(data0,personal0,outlen);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List groestl512(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashGroestl512(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List sha256SHA256(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashSHA256SHA256(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List sha256RIPEMD(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashSHA256RIPEMD(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List sha3_256RIPEMD(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashSHA3_256RIPEMD(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List blake256Blake256(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashBlake256Blake256(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List blake256RIPEMD(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashBlake256RIPEMD(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List groestl512Groestl512(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWHashGroestl512Groestl512(data0);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

}
