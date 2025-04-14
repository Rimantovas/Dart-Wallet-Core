part of 'generated.dart';

class PrivateKey {
  final Pointer<TWPrivateKey> rawValue;

  PrivateKey(this.rawValue);

  static PrivateKey create() {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWPrivateKeyCreate();

    deferManager.runDeferredActions();
    return PrivateKey(result);
  }

  static PrivateKey? createWithData(Uint8List data) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
      WalletCore.wcb.TWDataDelete(data0);
    });
    var result = WalletCore.wcb.TWPrivateKeyCreateWithData(data0);
    if (result.address == nullptr.address) {
      deferManager.runDeferredActions();
      return null;
    }

    deferManager.runDeferredActions();
    return PrivateKey(result);
  }

  static PrivateKey? createCopy(PrivateKey key) {
    final deferManager = DeferManager();
    var key0 = key.rawValue;
    var result = WalletCore.wcb.TWPrivateKeyCreateCopy(key0);
    if (result.address == nullptr.address) {
      deferManager.runDeferredActions();
      return null;
    }

    deferManager.runDeferredActions();
    return PrivateKey(result);
  }

  void deinit() {
    WalletCore.wcb.TWPrivateKeyDelete(rawValue);
  }

  static bool isValid(Uint8List data, Curve curve) {
    final deferManager = DeferManager();
    var data0 = TWDataCreateWithNSData(data);
    deferManager.defer(() {
      WalletCore.wcb.TWDataDelete(data0);
    });
    var curve0 = curve.value;
    var result = WalletCore.wcb.TWPrivateKeyIsValid(data0, curve0);
    deferManager.runDeferredActions();
    return result;
  }

  PublicKey getPublicKey(CoinType coinType) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var coinType0 = coinType.value;
    var result = WalletCore.wcb.TWPrivateKeyGetPublicKey(obj, coinType0);
    deferManager.runDeferredActions();
    return PublicKey(result);
  }

  PublicKey getPublicKeyByType(PublicKeyType pubkeyType) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var pubkeyType0 = pubkeyType.value;
    var result =
        WalletCore.wcb.TWPrivateKeyGetPublicKeyByType(obj, pubkeyType0);
    deferManager.runDeferredActions();
    return PublicKey(result);
  }

  PublicKey getPublicKeySecp256k1(bool compressed) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result =
        WalletCore.wcb.TWPrivateKeyGetPublicKeySecp256k1(obj, compressed);
    deferManager.runDeferredActions();
    return PublicKey(result);
  }

  PublicKey getPublicKeyNist256p1() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWPrivateKeyGetPublicKeyNist256p1(obj);
    deferManager.runDeferredActions();
    return PublicKey(result);
  }

  PublicKey getPublicKeyEd25519() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWPrivateKeyGetPublicKeyEd25519(obj);
    deferManager.runDeferredActions();
    return PublicKey(result);
  }

  PublicKey getPublicKeyEd25519Blake2b() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWPrivateKeyGetPublicKeyEd25519Blake2b(obj);
    deferManager.runDeferredActions();
    return PublicKey(result);
  }

  PublicKey getPublicKeyEd25519Cardano() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWPrivateKeyGetPublicKeyEd25519Cardano(obj);
    deferManager.runDeferredActions();
    return PublicKey(result);
  }

  PublicKey getPublicKeyCurve25519() {
    final deferManager = DeferManager();
    var obj = rawValue;
    var result = WalletCore.wcb.TWPrivateKeyGetPublicKeyCurve25519(obj);
    deferManager.runDeferredActions();
    return PublicKey(result);
  }

// Uint8List? getSharedKey(PublicKey publicKey, Curve curve) {
//     final deferManager = DeferManager();
//     var obj = rawValue;
//     var publicKey0 = publicKey.rawValue;
//     var curve0 = curve.value;
//     var result = WalletCore.wcb.TWPrivateKeyGetSharedKey(obj,publicKey0,curve0);
//     if (result.address == nullptr.address) {
//         deferManager.runDeferredActions();
//         return null;
//     }
//     deferManager.runDeferredActions();
//     return TWDataNSData(result);
// }
  Uint8List? sign(Uint8List digest, Curve curve) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var digest0 = TWDataCreateWithNSData(digest);
    deferManager.defer(() {
      WalletCore.wcb.TWDataDelete(digest0);
    });
    var curve0 = curve.value;
    var result = WalletCore.wcb.TWPrivateKeySign(obj, digest0, curve0);
    if (result.address == nullptr.address) {
      deferManager.runDeferredActions();
      return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
  }

  Uint8List? signAsDer(Uint8List digest) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var digest0 = TWDataCreateWithNSData(digest);
    deferManager.defer(() {
      WalletCore.wcb.TWDataDelete(digest0);
    });
    var result = WalletCore.wcb.TWPrivateKeySignAsDER(obj, digest0);
    if (result.address == nullptr.address) {
      deferManager.runDeferredActions();
      return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
  }

  Uint8List? signZilliqaSchnorr(Uint8List message) {
    final deferManager = DeferManager();
    var obj = rawValue;
    var message0 = TWDataCreateWithNSData(message);
    deferManager.defer(() {
      WalletCore.wcb.TWDataDelete(message0);
    });
    var result = WalletCore.wcb.TWPrivateKeySignZilliqaSchnorr(obj, message0);
    if (result.address == nullptr.address) {
      deferManager.runDeferredActions();
      return null;
    }
    deferManager.runDeferredActions();
    return TWDataNSData(result);
  }

  Uint8List get data {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWPrivateKeyData(rawValue);
    deferManager.runDeferredActions();
    return TWDataNSData(result);
  }
}
