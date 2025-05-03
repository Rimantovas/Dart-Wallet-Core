part of 'generated.dart';
class Mnemonic {
    Mnemonic();




static bool isValid(String mnemonic) {
    final deferManager = DeferManager();
    var mnemonic0 = TWStringCreateWithNSString(mnemonic);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(mnemonic0);
    });
    var result = WalletCore.wcb.TWMnemonicIsValid(mnemonic0);
    deferManager.runDeferredActions();
    return result;
}
static bool isValidWord(String word) {
    final deferManager = DeferManager();
    var word0 = TWStringCreateWithNSString(word);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(word0);
    });
    var result = WalletCore.wcb.TWMnemonicIsValidWord(word0);
    deferManager.runDeferredActions();
    return result;
}
static String suggest(String prefix) {
    final deferManager = DeferManager();
    var prefix0 = TWStringCreateWithNSString(prefix);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(prefix0);
    });
    var result = WalletCore.wcb.TWMnemonicSuggest(prefix0);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}

}
