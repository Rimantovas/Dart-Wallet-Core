part of 'generated.dart';
class TONAddressConverter {
    final Pointer<TWTONAddressConverter> rawValue;

    TONAddressConverter(this.rawValue);




static String? toBoc(String address) {
    final deferManager = DeferManager();
    var address0 = TWStringCreateWithNSString(address);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(address0);
    });
    var result = WalletCore.wcb.TWTONAddressConverterToBoc(address0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String? fromBoc(String boc) {
    final deferManager = DeferManager();
    var boc0 = TWStringCreateWithNSString(boc);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(boc0);
    });
    var result = WalletCore.wcb.TWTONAddressConverterFromBoc(boc0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String? toUserFriendly(String address, bool bounceable, bool testnet) {
    final deferManager = DeferManager();
    var address0 = TWStringCreateWithNSString(address);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(address0);
    });
    var result = WalletCore.wcb.TWTONAddressConverterToUserFriendly(address0,bounceable,testnet);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
