part of 'generated.dart';
class SolanaAddress extends Address {
    final Pointer<TWSolanaAddress> rawValue;

    SolanaAddress(this.rawValue);


static SolanaAddress? createWithString(String string) {
    final deferManager = DeferManager();
    var string0 = TWStringCreateWithNSString(string);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(string0);
    });
    var result = WalletCore.wcb.TWSolanaAddressCreateWithString(string0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }

    deferManager.runDeferredActions();
    return SolanaAddress(result);
}

    void deinit() {
        WalletCore.wcb.TWSolanaAddressDelete(rawValue);
    }

String? defaultTokenAddress(String tokenMintAddress) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var tokenMintAddress0 = TWStringCreateWithNSString(tokenMintAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(tokenMintAddress0);
    });
    var result = WalletCore.wcb.TWSolanaAddressDefaultTokenAddress(obj,tokenMintAddress0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
String? token2022Address(String tokenMintAddress) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var tokenMintAddress0 = TWStringCreateWithNSString(tokenMintAddress);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(tokenMintAddress0);
    });
    var result = WalletCore.wcb.TWSolanaAddressToken2022Address(obj,tokenMintAddress0);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}


String get description {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWSolanaAddressDescription(rawValue);
    deferManager.runDeferredActions();
    return TWStringNSString(result);
}
}
