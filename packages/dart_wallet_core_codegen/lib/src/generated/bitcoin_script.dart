part of 'generated.dart';
class BitcoinScript {
    final Pointer<TWBitcoinScript> rawValue;

    BitcoinScript(this.rawValue);

    @override
    bool operator ==(Object other) {
        if (identical(this, other)) return true;
        return other is BitcoinScript && WalletCore.wcb.TWBitcoinScriptEqual(rawValue, other.rawValue);
    }

    @override
    int get hashCode => rawValue.hashCode;

static BitcoinScript create() {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinScriptCreate();

    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static BitcoinScript createWithData(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWBitcoinScriptCreateWithData(data0);

    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static BitcoinScript createWithBytes(Uint8List bytes, int size) {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinScriptCreateWithBytes(bytes,size);

    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static BitcoinScript createCopy(BitcoinScript script) {
    final deferManager = DeferManager();
    var script0 = script.rawValue;
    var result = WalletCore.wcb.TWBitcoinScriptCreateCopy(script0);

    deferManager.runDeferredActions();
    return BitcoinScript(result);
}

    void deinit() {
        WalletCore.wcb.TWBitcoinScriptDelete(rawValue);
    }

Uint8List? matchPayToPubkey() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWBitcoinScriptMatchPayToPubkey(obj);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
Uint8List? matchPayToPubkeyHash() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWBitcoinScriptMatchPayToPubkeyHash(obj);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
Uint8List? matchPayToScriptHash() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWBitcoinScriptMatchPayToScriptHash(obj);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
Uint8List? matchPayToWitnessPublicKeyHash() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWBitcoinScriptMatchPayToWitnessPublicKeyHash(obj);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
Uint8List? matchPayToWitnessScriptHash() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWBitcoinScriptMatchPayToWitnessScriptHash(obj);
    if (result.address == nullptr.address) {
        deferManager.runDeferredActions();
        return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
Uint8List encode() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWBitcoinScriptEncode(obj);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}
static BitcoinScript buildPayToPublicKey(Uint8List pubkey) {
    final deferManager = DeferManager();
    var pubkey0 = TWDataCreateWithNSData(pubkey);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(pubkey0);
    });
    var result = WalletCore.wcb.TWBitcoinScriptBuildPayToPublicKey(pubkey0);
    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static BitcoinScript buildPayToPublicKeyHash(Uint8List hash) {
    final deferManager = DeferManager();
    var hash0 = TWDataCreateWithNSData(hash);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(hash0);
    });
    var result = WalletCore.wcb.TWBitcoinScriptBuildPayToPublicKeyHash(hash0);
    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static BitcoinScript buildPayToScriptHash(Uint8List scriptHash) {
    final deferManager = DeferManager();
    var scriptHash0 = TWDataCreateWithNSData(scriptHash);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(scriptHash0);
    });
    var result = WalletCore.wcb.TWBitcoinScriptBuildPayToScriptHash(scriptHash0);
    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static BitcoinScript buildPayToWitnessPubkeyHash(Uint8List hash) {
    final deferManager = DeferManager();
    var hash0 = TWDataCreateWithNSData(hash);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(hash0);
    });
    var result = WalletCore.wcb.TWBitcoinScriptBuildPayToWitnessPubkeyHash(hash0);
    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static BitcoinScript buildPayToWitnessScriptHash(Uint8List scriptHash) {
    final deferManager = DeferManager();
    var scriptHash0 = TWDataCreateWithNSData(scriptHash);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(scriptHash0);
    });
    var result = WalletCore.wcb.TWBitcoinScriptBuildPayToWitnessScriptHash(scriptHash0);
    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static BitcoinScript lockScriptForAddress(String address, CoinType coin) {
    final deferManager = DeferManager();
    var address0 = TWStringCreateWithNSString(address);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(address0);
    });
    var coin0 = coin.value;
    var result = WalletCore.wcb.TWBitcoinScriptLockScriptForAddress(address0,coin0);
    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static BitcoinScript lockScriptForAddressReplay(String address, CoinType coin, Uint8List blockHash, int blockHeight) {
    final deferManager = DeferManager();
    var address0 = TWStringCreateWithNSString(address);
    deferManager.defer(() {
        WalletCore.wcb.TWStringDelete(address0);
    });
    var coin0 = coin.value;
    var blockHash0 = TWDataCreateWithNSData(blockHash);
    deferManager.defer(() {
        WalletCore.wcb.TWDataDelete(blockHash0);
    });
    var result = WalletCore.wcb.TWBitcoinScriptLockScriptForAddressReplay(address0,coin0,blockHash0,blockHeight);
    deferManager.runDeferredActions();
    return BitcoinScript(result);
}
static int hashTypeForCoin(CoinType coinType) {
    final deferManager = DeferManager();
    var coinType0 = coinType.value;
    var result = WalletCore.wcb.TWBitcoinScriptHashTypeForCoin(coinType0);
    deferManager.runDeferredActions();
    return result;
}


int get size {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinScriptSize(rawValue);
    deferManager.runDeferredActions();
    return result;
}

Uint8List get data {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinScriptData(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

Uint8List get scriptHash {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinScriptScriptHash(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
}

bool get isPayToScriptHash {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinScriptIsPayToScriptHash(rawValue);
    deferManager.runDeferredActions();
    return result;
}

bool get isPayToWitnessScriptHash {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinScriptIsPayToWitnessScriptHash(rawValue);
    deferManager.runDeferredActions();
    return result;
}

bool get isPayToWitnessPublicKeyHash {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinScriptIsPayToWitnessPublicKeyHash(rawValue);
    deferManager.runDeferredActions();
    return result;
}

bool get isWitnessProgram {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWBitcoinScriptIsWitnessProgram(rawValue);
    deferManager.runDeferredActions();
    return result;
}
}
