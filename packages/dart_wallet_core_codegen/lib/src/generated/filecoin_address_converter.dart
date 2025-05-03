part of 'generated.dart';
class FilecoinAddressConverter {
    FilecoinAddressConverter();




static String convertToEthereum(String filecoinAddress) {
    final deferManager = DeferManager();
    var filecoinAddress0 = TWStringCreateWithNSString(filecoinAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(filecoinAddress0);
    });
    var result = WalletCore.wcb.TWFilecoinAddressConverterConvertToEthereum(filecoinAddress0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
static String convertFromEthereum(String ethAddress) {
    final deferManager = DeferManager();
    var ethAddress0 = TWStringCreateWithNSString(ethAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(ethAddress0);
    });
    var result = WalletCore.wcb.TWFilecoinAddressConverterConvertFromEthereum(ethAddress0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
