part of 'generated.dart';
class Base32 {
    Base32();




static Uint8List? decodeWithAlphabet(String string, String? alphabet) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    Pointer<Void> ptr;
    if (alphabet != null) {
        ptr = TWStringCreateWithNSString(alphabet);
    } else {
        ptr = nullptr;
    }
    deferManager.defer(() {
        if (ptr.address != nullptr.address) {
            WalletCore.wcb.TWStringDelete(ptr);
        }
    });
    var alphabet0 = ptr;
    var result = WalletCore.wcb.TWBase32DecodeWithAlphabet(string0,alphabet0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static Uint8List? decode(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWBase32Decode(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static String encodeWithAlphabet(Uint8List data, String? alphabet) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    Pointer<Void> ptr;
    if (alphabet != null) {
        ptr = TWStringCreateWithNSString(alphabet);
    } else {
        ptr = nullptr;
    }
    deferManager.defer(() {
        if (ptr.address != nullptr.address) {
            WalletCore.wcb.TWStringDelete(ptr);
        }
    });
    var alphabet0 = ptr;
    var result = WalletCore.wcb.TWBase32EncodeWithAlphabet(data0,alphabet0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String encode(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWBase32Encode(data0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
