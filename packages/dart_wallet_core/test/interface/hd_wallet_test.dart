import 'dart:typed_data';

import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

const wordsStr =
    "ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal";
const gWords = wordsStr;
const gPassphrase = "TREZOR";
const seedHex =
    "7ae6f661157bda6492f6162701e570097fc726b6235011ea5ad09bf04986731ed4d92bc43cbdee047b60ea0dd1b1fa4274377c9bf5bd14ab1982c272d8076f29";
const entropyHex = "ba5821e8c356c05ba5f025d9532fe0f21f65d594";

void main() {
  initTest();

  group('HDWallet', () {
    test('CreateFromMnemonic', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      expect(wallet?.mnemonic, wordsStr);
      expectHex(wallet?.entropy.toList() ?? [], entropyHex);
      expectHex(wallet?.seed.toList() ?? [], seedHex);
    });

    test('CreateFromEntropy', () {
      final wallet = HDWallet.createWithEntropy(
          HexUtils.hexToBytes(entropyHex), gPassphrase);
      expect(wallet?.mnemonic, wordsStr);
      expectHex(wallet?.entropy.toList() ?? [], entropyHex);
      expectHex(wallet?.seed.toList() ?? [], seedHex);
    });

    test('Generate', () {
      final wallet = HDWallet.create(128, gPassphrase);
      expect(Mnemonic.isValid(wallet?.mnemonic ?? ''), true);
    });

    test('SeedWithExtraSpaces', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      expectHex(wallet?.seed.toList() ?? [], seedHex);
    });

    test('CreateFromMnemonicNoPassword', () {
      final wallet = HDWallet.createWithMnemonic(gWords, '');
      expectHex(wallet?.seed.toList() ?? [],
          '354c22aedb9a37407adc61f657a6f00d10ed125efa360215f36c6919abd94d6dbc193a5f9c495e21ee74118661e327e84a5f5f11fa373ec33b80897d4697557d');
    });

    test('CreateFromMnemonicCheck', () {
      final wallet = HDWallet.createWithMnemonicCheck(gWords, '', false);
      expectHex(wallet?.seed.toList() ?? [],
          '354c22aedb9a37407adc61f657a6f00d10ed125efa360215f36c6919abd94d6dbc193a5f9c495e21ee74118661e327e84a5f5f11fa373ec33b80897d4697557d');
    });

    test('CreateFromStrengthInvalid', () {
      expect(HDWallet.create(64, ''), isNull);
    });

    test('CreateFromStrengthInvalid', () {
      expect(
          HDWallet.createWithMnemonic("THIS IS INVALID MNEMONIC", ''), isNull);
    });

    test('MasterPrivateKey', () {
      final wallet = HDWallet.createWithMnemonic(gWords, '');
      final key1 = wallet?.getMasterKey(Curve.Secp256k1);
      final hexKey1 = key1?.data;

      final key2 = wallet?.getMasterKey(Curve.Ed25519);
      final hexKey2 = key2?.data;

      expectHex(hexKey1 ?? [],
          'd1b2b553b053f278d510a8494ead811252b1d5ec0da4434d0997a75de92bcea9');
      expectHex(hexKey2 ?? [],
          'd258c2521f7802b8e83c32f2cc97bd06b69747847390c5e247a3d19faa74202e');
    });

    test('Derive', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key0 = wallet?.getKeyForCoin(CoinType.Ethereum);

      final publicKey0 = key0?.getPublicKeySecp256k1(false);
      final publicKey0Data = publicKey0?.data;

      expectHex(publicKey0Data ?? [],
          '0414acbe5a06c68210fcbb77763f9612e45a526990aeb69d692d705f276f558a5ae68268e9389bb099ed5ac84d8d6861110f63644f6e5b447e3f86b4bab5dee011');
    });

    test('DeriveBitcoinNonextended', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key = wallet?.getKeyForCoin(CoinType.Bitcoin);
      final publicKey = key?.getPublicKeySecp256k1(false);
      final publickKeyData = publicKey?.data;

      expectHex(publickKeyData ?? [],
          '047ea5dff03f677502c4a1d73c5ac897200e56b155e876774c8fba0cc22f80b9414ec07cda7b1c9a84c2e04ea2746c21afacc5e91b47427c453c3f1a4a3e983ce5');
      // Note: address derivation does not work with nonextended public key
    });

    test('DeriveBitcoinExtended', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key = wallet?.getKeyForCoin(CoinType.Bitcoin);
      final publicKey = key?.getPublicKeySecp256k1(true);
      final publickKeyData = publicKey?.data;

      expectHex(publickKeyData ?? [],
          '037ea5dff03f677502c4a1d73c5ac897200e56b155e876774c8fba0cc22f80b941');

      if (publicKey != null) {
        final address = CoinType.Bitcoin.deriveAddressFromPublicKey(publicKey);
        expect(address, 'bc1qumwjg8danv2vm29lp5swdux4r60ezptzz7ce85');
      } else {
        expect(true, true);
      }
    });

    test('GetKeyDerivation', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      {
        final key = wallet?.getKeyDerivation(
            CoinType.Bitcoin, Derivation.BitcoinSegwit);
        expectHex(key?.data ?? [],
            '1901b5994f075af71397f65bd68a9fff8d3025d65f5a2c731cf90f5e259d6aac');
        final publicKey = key?.getPublicKeySecp256k1(true);
        final publicKeyData = publicKey?.data;
        expectHex(publicKeyData ?? [],
            '037ea5dff03f677502c4a1d73c5ac897200e56b155e876774c8fba0cc22f80b941');
      }
      {
        final key = wallet?.getKeyDerivation(
            CoinType.Bitcoin, Derivation.BitcoinLegacy);
        expectHex(key?.data ?? [],
            '28071bf4e2b0340db41b807ed8a5514139e5d6427ff9d58dbd22b7ed187103a4');
        final publicKey = key?.getPublicKeySecp256k1(true);
        final publicKeyData = publicKey?.data;
        expectHex(publicKeyData ?? [],
            '0240ebf906b948281289405317a5eb9a98045af8a8ab5311b2e3060cfb66c507a1');
      }

      {
        final key = wallet?.getKeyDerivation(
            CoinType.Bitcoin, Derivation.BitcoinTaproot);
        expectHex(key?.data ?? [],
            "a2c4d6df786f118f20330affd65d248ffdc0750ae9cbc729d27c640302afd030");
        final publicKey = key?.getPublicKeySecp256k1(true);
        final publicKeyData = publicKey?.data;
        expectHex(publicKeyData ?? [],
            "026acc6c37789625ecd5ad4ebb7631249dfb9ebc3f82386f187325f54881557b9f");
      }
    });

    test('DeriveAddressBitcoin', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final address = wallet?.getAddressForCoin(CoinType.Bitcoin);
      expect(address, 'bc1qumwjg8danv2vm29lp5swdux4r60ezptzz7ce85');
    });

    test('DeriveAddressBitcoinDerivation', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      {
        final address = wallet?.getAddressDerivation(
            CoinType.Bitcoin, Derivation.BitcoinSegwit);
        expect(address, 'bc1qumwjg8danv2vm29lp5swdux4r60ezptzz7ce85');
      }
      {
        final address = wallet?.getAddressDerivation(
            CoinType.Bitcoin, Derivation.BitcoinLegacy);
        expect(address, '1PeUvjuxyf31aJKX6kCXuaqxhmG78ZUdL1');
      }
    });

    test('DeriveEthereum', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key = wallet?.getKeyForCoin(CoinType.Ethereum);
      final key2 = wallet?.getKeyForCoin(CoinType.SmartChain);

      final publicKey = key?.getPublicKeySecp256k1(false);
      final publicKey2 = key2?.getPublicKeySecp256k1(false);
      final publicKeyData = publicKey?.data;

      final address = CoinType.Ethereum.deriveAddressFromPublicKey(publicKey!);
      final address2 =
          CoinType.SmartChain.deriveAddressFromPublicKey(publicKey2!);

      expectHex(publicKeyData ?? [],
          '0414acbe5a06c68210fcbb77763f9612e45a526990aeb69d692d705f276f558a5ae68268e9389bb099ed5ac84d8d6861110f63644f6e5b447e3f86b4bab5dee011');
      expect(address, '0x27Ef5cDBe01777D62438AfFeb695e33fC2335979');
      expect(address2, '0x27Ef5cDBe01777D62438AfFeb695e33fC2335979');
    });

    test('DeriveAddressEthereum', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final address = wallet?.getAddressForCoin(CoinType.Ethereum);
      expect(address, '0x27Ef5cDBe01777D62438AfFeb695e33fC2335979');
    });

    test('DeriveCosmos', () {
      // use `gaiacli keys add key_name` to generate mnemonic words and private key
      final wallet = HDWallet.createWithMnemonic(
          'attract term foster morning tail foam excite copper disease measure cheese camera rug enroll cause flip sword waste try local purchase between idea thank',
          '');
      final privateKey = wallet?.getKeyForCoin(CoinType.Cosmos);
      final privateKeyData = privateKey?.data;

      expectHex(privateKeyData ?? [],
          '80e81ea269e66a0a05b11236df7919fb7fbeedba87452d667489d7403a02f005');

      final publicKey = privateKey?.getPublicKeySecp256k1(true);
      final publicKeyData = publicKey?.data;

      expectHex(publicKeyData ?? [],
          '0257286ec3f37d33557bbbaa000b27744ac9023aa9967cae75a181d1ff91fa9dc5');
    });

    test('DeriveNimiq', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key = wallet?.getKeyForCoin(CoinType.Nimiq);
      final publicKey = key?.getPublicKeyEd25519();
      final publicKeyData = publicKey?.data;

      expectHex(publicKeyData ?? [],
          '1937063865fe3294ccf3017837207bb3fea71a53720ae631b77bf9d5ca4f7f4c');
    });

    test('DeriveTezos', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key = wallet?.getKeyForCoin(CoinType.Tezos);
      final publicKey = key?.getPublicKeyEd25519();
      final publicKeyData = publicKey?.data;

      expectHex(publicKeyData ?? [],
          'c834147f97bcf95bf01f234455646a197f70b25e93089591ffde8122370ad371');
    });

    test('DeriveDoge', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key = wallet?.getKeyForCoin(CoinType.Dogecoin);
      final publicKey = key?.getPublicKeySecp256k1(true);
      final publicKeyData = publicKey?.data;

      expectHex(publicKeyData ?? [],
          '039fc134623a37c8ee44881f088a599cc44ba8a95f91f860b99d9d3b11f487e4c0');

      final xprv = wallet?.getExtendedPrivateKey(
        Purpose.Bip44,
        CoinType.Dogecoin,
        HDVersion.Dgpv,
      );
      expect(xprv,
          'dgpv57ru95KiYUB5oWm2CVQH4heh1f7E9dNGdRHHVThcQkLeQ2HHxVJfFYefnpKrWZ6L6EDKJHUVq4Yyd5kPZKnRePfkCz3EzkySTydXKbgjcxN');

      final xpub = wallet?.getExtendedPublicKey(
        Purpose.Bip44,
        CoinType.Dogecoin,
        HDVersion.Dgub,
      );
      expect(xpub,
          'dgub8rjvUmFc6cqR6NRBEj2FBZCHUDUrykPyv24Vea6bCsPex5PzNFrRtr4KN37XgwuVzzC2MikJRW2Ddcp99Ehsqp2iaU4eerNCJVruKxz6Gci');
    });

    test('DeriveZilliqa', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key = wallet?.getKeyForCoin(CoinType.Zilliqa);
      final publicKey = key?.getPublicKeySecp256k1(true);
      final publicKeyData = publicKey?.data;

      expectHex(publicKeyData ?? [],
          '0262746d4988c63b9972c63272461e9fa080d4dfa2a1fda3dd01285620c0a60c22');
    });

    test('DeriveAionPrivateKey', () {
      final wallet = HDWallet.createWithMnemonic(
          'zero behind diesel afraid edge salad drop episode high pear twin resource',
          '');
      final privateKey = wallet?.getKeyForCoin(CoinType.Aion);
      final privateKeyData = privateKey?.data;

      expectHex(privateKeyData ?? [],
          'db33ffdf82c7ba903daf68d961d3c23c20471a8ce6b408e52d579fd8add80cc9');
    });

    test('DeriveFIO', () {
      final wallet = HDWallet.createWithMnemonic(
          'valley alien library bread worry brother bundle hammer loyal barely dune brave',
          '');
      final privateKey = wallet?.getKeyForCoin(CoinType.Fio);
      final privateKeyData = privateKey?.data;
      final prefix = Uint8List.fromList([0x80, ...privateKeyData ?? []]);
      final base58 = Base58.encode(prefix);

      expectHex(privateKeyData ?? [],
          'ea8eb60b7e5868e218f248e032769020b4fea5dcfd02f2992861eaf4fb534854');
      expect(base58, '5Kbb37EAqQgZ9vWUHoPiC2uXYhyGSFNbL6oiDp24Ea1ADxV1qnu');
    });

    test('DeriveAlgorand', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final privateKey = wallet?.getKeyForCoin(CoinType.Algorand);
      final privateKeyData = privateKey?.data;

      expectHex(privateKeyData!,
          'ce0b7ac644e2b7d9d14d3928b11643f43e48c33d3e328d059fef8add7f070e82');
    });

    test('DeriveMultiversX', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final privateKey = wallet?.getKeyForCoin(CoinType.MultiversX);
      final privateKeyData = privateKey?.data;
      final address = CoinType.MultiversX.deriveAddress(privateKey!);

      expectHex(privateKeyData!,
          '0eb593141de897d60a0883320793eb49e63d556ccdf783a87ec014f150d50453');
      expect(address,
          'erd1a6l7q9cfvrgr80xuzm37tapdr4zm3mwrtl6vt8f45df45x7eadfs8ds5vv');
    });

    test('DeriveBinance', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key = wallet?.getKeyForCoin(CoinType.Binance);
      final key2 = wallet?.getKeyForCoin(CoinType.SmartChain);
      final keyData = key?.data;
      final keyData2 = key2?.data;

      const expected =
          "ca81b1b0974aa063de2f74c17b9dc364a8208d105659f4f900c121fb170922fe";
      const expectedETH =
          "c4f77b4a9f5a0db3a7ffc3599e61bef986037ae9a7cc1972a10d55c030270020";

      expectHex(keyData ?? [], expected);
      expectHex(keyData2 ?? [], expectedETH);
    });

    test('DeriveAvalancheCChain', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final key = wallet?.getKeyForCoin(CoinType.Avalanchecchain);
      final keyData = key?.data;

      const expectedETH =
          "c4f77b4a9f5a0db3a7ffc3599e61bef986037ae9a7cc1972a10d55c030270020";

      expectHex(keyData ?? [], expectedETH);
    });

    test('DeriveCardano', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final privateKey = wallet?.getKeyForCoin(CoinType.Cardano);
      final privateKeyData = privateKey?.data;
      expect(privateKeyData?.length, 192);
      final address = CoinType.Cardano.deriveAddress(privateKey!);

      expectHex(privateKeyData ?? [],
          'f8a3b8ad30e62c369b939336c2035aba26d1ffad135e6f346f2a370517a14952e73d20aeadf906bc8b531900fb6c3ed4a05b16973c10ae24650b68b26fae4ee5d97418ba7f3b2707fae963041ff5f174195d1578da09478ad2d17a1ecc00cad478a8ca3be214870accd41f008d70e3b4b59b5981ca933d6d3f389ad317a14952166d8fd329ae3fab4712da739efc2ded9b3eef2b1a8e225dd3dddeb4f065a729b297d9fa76b8852eef235c25aac8f0ff6209ab7251f2a84c83b3b5f1161f7c59');
      expect(address,
          'addr1q9zz5nj4rqdvteauvdtc834f2vtzyrdrrdmnwdyp4s6huuz5fp33p9cq4xwpqtgguaxknzurmglv58yn9wrv6angpvvq9u36ya');
    });

    test('ExtendedKeys', () {
      const words =
          'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';
      final wallet = HDWallet.createWithMnemonic(words, '');

      final xprv = wallet?.getExtendedPrivateKey(
        Purpose.Bip44,
        CoinType.Bitcoin,
        HDVersion.Xprv,
      );
      final xpub = wallet?.getExtendedPublicKey(
        Purpose.Bip44,
        CoinType.Bitcoin,
        HDVersion.Xpub,
      );
      expect(xprv,
          'xprv9xpXFhFpqdQK3TmytPBqXtGSwS3DLjojFhTGht8gwAAii8py5X6pxeBnQ6ehJiyJ6nDjWGJfZ95WxByFXVkDxHXrqu53WCRGypk2ttuqncb');
      expect(xpub,
          'xpub6BosfCnifzxcFwrSzQiqu2DBVTshkCXacvNsWGYJVVhhawA7d4R5WSWGFNbi8Aw6ZRc1brxMyWMzG3DSSSSoekkudhUd9yLb6qx39T9nMdj');

      final yprv = wallet?.getExtendedPrivateKey(
        Purpose.Bip49,
        CoinType.Bitcoin,
        HDVersion.Yprv,
      );
      final ypub = wallet?.getExtendedPublicKey(
        Purpose.Bip49,
        CoinType.Bitcoin,
        HDVersion.Ypub,
      );
      expect(yprv,
          'yprvAHwhK6RbpuS3dgCYHM5jc2ZvEKd7Bi61u9FVhYMpgMSuZS613T1xxQeKTffhrHY79hZ5PsskBjcc6C2V7DrnsMsNaGDaWev3GLRQRgV7hxF');
      expect(ypub,
          'ypub6Ww3ibxVfGzLrAH1PNcjyAWenMTbbAosGNB6VvmSEgytSER9azLDWCxoJwW7Ke7icmizBMXrzBx9979FfaHxHcrArf3zbeJJJUZPf663zsP');

      final zprv = wallet?.getExtendedPrivateKey(
        Purpose.Bip84,
        CoinType.Bitcoin,
        HDVersion.Zprv,
      );
      final zpub = wallet?.getExtendedPublicKey(
        Purpose.Bip84,
        CoinType.Bitcoin,
        HDVersion.Zpub,
      );
      expect(zprv,
          'zprvAdG4iTXWBoARxkkzNpNh8r6Qag3irQB8PzEMkAFeTRXxHpbF9z4QgEvBRmfvqWvGp42t42nvgGpNgYSJA9iefm1yYNZKEm7z6qUWCroSQnE');
      expect(zpub,
          'zpub6rFR7y4Q2AijBEqTUquhVz398htDFrtymD9xYYfG1m4wAcvPhXNfE3EfH1r1ADqtfSdVCToUG868RvUUkgDKf31mGDtKsAYz2oz2AGutZYs');

      final emptyPrv = wallet?.getExtendedPrivateKey(
        Purpose.Bip44,
        CoinType.Bitcoin,
        HDVersion.None,
      );
      final emptyPub = wallet?.getExtendedPublicKey(
        Purpose.Bip44,
        CoinType.Bitcoin,
        HDVersion.None,
      );
      expect(emptyPrv, '');
      expect(emptyPub, '');
    });

    test('ExtendedKeysCustomAccount', () {
      const words =
          'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';
      final wallet = HDWallet.createWithMnemonic(words, '');

      final zprv0 = wallet?.getExtendedPrivateKeyAccount(
        Purpose.Bip84,
        CoinType.Bitcoin,
        Derivation.BitcoinSegwit,
        HDVersion.Zprv,
        0,
      );
      expect(zprv0,
          'zprvAdG4iTXWBoARxkkzNpNh8r6Qag3irQB8PzEMkAFeTRXxHpbF9z4QgEvBRmfvqWvGp42t42nvgGpNgYSJA9iefm1yYNZKEm7z6qUWCroSQnE');
      final zprv1 = wallet?.getExtendedPrivateKeyAccount(
        Purpose.Bip84,
        CoinType.Bitcoin,
        Derivation.BitcoinSegwit,
        HDVersion.Zprv,
        1,
      );
      expect(zprv1,
          'zprvAdG4iTXWBoAS2cCGuaGevCvH54GCunrvLJb2hoWCSuE3D9LS42XVg3c6sPm64w6VMq3w18vJf8nF3cBA2kUMkyWHsq6enWVXivzw42UrVHG');

      final zpub0 = wallet?.getExtendedPublicKeyAccount(
        Purpose.Bip84,
        CoinType.Bitcoin,
        Derivation.BitcoinSegwit,
        HDVersion.Zpub,
        0,
      );
      expect(zpub0,
          'zpub6rFR7y4Q2AijBEqTUquhVz398htDFrtymD9xYYfG1m4wAcvPhXNfE3EfH1r1ADqtfSdVCToUG868RvUUkgDKf31mGDtKsAYz2oz2AGutZYs');
      final zpub1 = wallet?.getExtendedPublicKeyAccount(
        Purpose.Bip84,
        CoinType.Bitcoin,
        Derivation.BitcoinSegwit,
        HDVersion.Zpub,
        1,
      );
      expect(zpub1,
          'zpub6rFR7y4Q2AijF6Gk1bofHLs1d66hKFamhXWdWBup1Em25wfabZqkDqvaieV63fDQFaYmaatCG7jVNUpUiM2hAMo6SAVHcrUpSnHDpNzucB7');
    });

    test('PublicKeyFromX', () {
      const xpub =
          'xpub6BosfCnifzxcFwrSzQiqu2DBVTshkCXacvNsWGYJVVhhawA7d4R5WSWGFNbi8Aw6ZRc1brxMyWMzG3DSSSSoekkudhUd9yLb6qx39T9nMdj';
      final xpubAddr2 = HDWallet.getPublicKeyFromExtended(
        xpub,
        CoinType.BitcoinCash,
        "m/44'/145'/0'/0/2",
      );
      final xpubAddr9 = HDWallet.getPublicKeyFromExtended(
        xpub,
        CoinType.BitcoinCash,
        "m/44'/145'/0'/0/9",
      );

      final data2 = xpubAddr2?.data;
      final data9 = xpubAddr9?.data;

      expectHex(data2 ?? [],
          '0338994349b3a804c44bbec55c2824443ebb9e475dfdad14f4b1a01a97d42751b3');
      expectHex(data9 ?? [],
          '03786c1d274f2c804ff9a57d8e7289c281d4aef15e17187ad9f9c3722d81a6ae66');
    });

    test('PublicKeyInvalid', () {
      const xpub = 'xpub0000';
      final xpubAddr = HDWallet.getPublicKeyFromExtended(
        xpub,
        CoinType.BitcoinCash,
        "m/44'/145'/0'/0/0",
      );
      expect(xpubAddr, isNull);
    });

    test('PublicKeyFromY', () {
      const ypub =
          'ypub6Ww3ibxVfGzLrAH1PNcjyAWenMTbbAosGNB6VvmSEgytSER9azLDWCxoJwW7Ke7icmizBMXrzBx9979FfaHxHcrArf3zbeJJJUZPf663zsP';
      final ypubAddr3 = HDWallet.getPublicKeyFromExtended(
        ypub,
        CoinType.BitcoinCash,
        "m/44'/0'/0'/0/3",
      );
      final ypubAddr10 = HDWallet.getPublicKeyFromExtended(
        ypub,
        CoinType.BitcoinCash,
        "m/44'/0'/0'/0/10",
      );

      final data3 = ypubAddr3?.data;
      final data10 = ypubAddr10?.data;

      expectHex(data3 ?? [],
          '0299bd0bdc081a9888fac95a33e8bebcdeeb57cf7477f2f0721362f3a51a157227');
      expectHex(data10 ?? [],
          '03a39ad9c0d19bb43c45643582614298c96b0f7c9462c0de789c69013b0d609d1c');
    });

    test('PublicKeyFromZ', () {
      const zpub =
          'zpub6rFR7y4Q2AijBEqTUquhVz398htDFrtymD9xYYfG1m4wAcvPhXNfE3EfH1r1ADqtfSdVCToUG868RvUUkgDKf31mGDtKsAYz2oz2AGutZYs';
      final zpubAddr4 = HDWallet.getPublicKeyFromExtended(
        zpub,
        CoinType.BitcoinCash,
        "m/44'/0'/0'/0/4",
      );
      final zpubAddr11 = HDWallet.getPublicKeyFromExtended(
        zpub,
        CoinType.BitcoinCash,
        "m/44'/0'/0'/0/11",
      );

      final data4 = zpubAddr4?.data;
      final data11 = zpubAddr11?.data;

      final address4 = CoinType.Bitcoin.deriveAddressFromPublicKey(zpubAddr4!);

      expectHex(data4 ?? [],
          '03995137c8eb3b223c904259e9b571a8939a0ec99b0717684c3936407ca8538c1b');
      expectHex(data11 ?? [],
          '0226a07edd0227fa6bc36239c0bd4db83d5e488f8fb1eeb68f89a5be916aad2d60');

      expect(address4, 'bc1qm97vqzgj934vnaq9s53ynkyf9dgr05rargr04n');
    });

    test('PublicKeyFromExtended_Ethereum', () {
      const xpub =
          'xpub6C7LtZJgtz1BKXG9mExKUxYvX7HSF38UMMmGbpqNQw3DfYwAw8E6sH7VSVxFipvEEm2afSqTjoRgcLmycXX4zfxCWJ4HY73a9KdgvfHEQGB';
      final xpubAddr = HDWallet.getPublicKeyFromExtended(
        xpub,
        CoinType.Ethereum,
        "m/44'/60'/0'/0/1",
      );
      expect(xpubAddr, isNotNull);
      final data = xpubAddr?.data;
      expectHex(data ?? [],
          '044516c4aa5352035e1bb5be132694e1389a4ac37d32e5e717d35ee4c4dfab513226a9d14ea37a55962ad3644a08e2ce551b4495beabb9b09e688c7b92eba18acc');
    });

    test('PublicKeyFromExtended_NIST256p1', () {
      const xpub =
          'xpub6BosfCnifzxcFwrSzQiqu2DBVTshkCXacvNsWGYJVVhhawA7d4R5WSWGFNbi8Aw6ZRc1brxMyWMzG3DSSSSoekkudhUd9yLb6qx39T9nMdj';
      final xpubAddr = HDWallet.getPublicKeyFromExtended(
        xpub,
        CoinType.Neo,
        "m/44'/888'/0'/0/0",
      );
      expect(xpubAddr, isNotNull);
      final data = xpubAddr?.data;
      expectHex(data ?? [],
          '03774c910fcf07fa96886ea794f0d5caed9afe30b44b83f7e213bb92930e7df4bd');
    });

    test('PublicKeyFromExtended_Negative', () {
      const xpub =
          'xpub6BosfCnifzxcFwrSzQiqu2DBVTshkCXacvNsWGYJVVhhawA7d4R5WSWGFNbi8Aw6ZRc1brxMyWMzG3DSSSSoekkudhUd9yLb6qx39T9nMdj';
      {
        // Ed25519
        final xpubAddr = HDWallet.getPublicKeyFromExtended(
          xpub,
          CoinType.Solana,
          "m/44'/501'/0'",
        );
        expect(xpubAddr, isNull);
      }
      {
        // Ed25519Extended
        final xpubAddr = HDWallet.getPublicKeyFromExtended(
          xpub,
          CoinType.Cardano,
          "m/1852'/1815'/0'/0/0",
        );
        expect(xpubAddr, isNull);
      }
      {
        // Ed25519Blake2bNano
        final xpubAddr = HDWallet.getPublicKeyFromExtended(
          xpub,
          CoinType.Nano,
          "m/44'/165'/0'",
        );
        expect(xpubAddr, isNull);
      }
      {
        // Curve25519
        final xpubAddr = HDWallet.getPublicKeyFromExtended(
          xpub,
          CoinType.Waves,
          "m/44'/5741564'/0'/0'/0'",
        );
        expect(xpubAddr, isNull);
      }
    });

    test('GetDerivedKey', () {
      final wallet = HDWallet.createWithMnemonic(gWords, gPassphrase);
      final privateKey = wallet?.getDerivedKey(
        CoinType.Bitcoin,
        0,
        0,
        0,
      );
      final privateKeyData = privateKey?.data;
      expectHex(privateKeyData ?? [],
          '1901b5994f075af71397f65bd68a9fff8d3025d65f5a2c731cf90f5e259d6aac');
    });

    test('GetKeyByCurve', () {
      const derivPath = "m/44'/539'/0'/0/0";

      final wallet = HDWallet.createWithMnemonic(gWords, '');
      final privateKey1 = wallet?.getKeyByCurve(Curve.Secp256k1, derivPath);
      final privateKeyData1 = privateKey1?.data;
      expectHex(privateKeyData1 ?? [],
          '4fb8657d6464adcaa086d6758d7f0b6b6fc026c98dc1671fcc6460b5a74abc62');

      final privateKey2 = wallet?.getKeyByCurve(Curve.Nist256p1, derivPath);
      final privateKeyData2 = privateKey2?.data;
      expectHex(privateKeyData2 ?? [],
          'a13df52d5a5b438bbf921bbf86276e4347fe8e2f2ed74feaaee12b77d6d26f86');
    });

    test('FromMnemonicImmutableXMainnetFromSignature', () {
      // Successfully register: https://api.x.immutable.com/v1/users/0xd0972E2312518Ca15A2304D56ff9cc0b7ea0Ea37
      const mnemonic =
          'obscure opera favorite shuffle mail tip age debate dirt pact cement loyal';
      const ethAddress = '0xd0972E2312518Ca15A2304D56ff9cc0b7ea0Ea37';
      const layer = 'starkex';
      const application = 'immutablex';
      const index = '1';
      const ethDerivationPath = "m/44'/60'/0'/0/0";
      final wallet = HDWallet.createWithMnemonic(mnemonic, '');
      final derivationPath =
          Ethereum.eip2645GetPath(ethAddress, layer, application, index);
      expect(derivationPath,
          "m/2645'/579218131'/211006541'/2124474935'/1609799702'/1");

      // Retrieve eth private key
      final ethPrivateKey =
          wallet?.getKey(CoinType.Ethereum, ethDerivationPath);
      final ethPrivateKeyData = ethPrivateKey?.data;
      expectHex(ethPrivateKeyData ?? [],
          '03a9ca895dca1623c7dfd69693f7b4111f5d819d2e145536e0b03c136025a25d');

      // StarkKey Derivation Path
      final starkDerivationPath =
          DerivationPath.createWithString(derivationPath);

      // Retrieve Stark Private key part
      const ethMsg =
          "Only sign this request if you’ve initiated an action with Immutable X.";
      final ethSignature =
          EthereumMessageSigner.signMessageImmutableX(ethPrivateKey!, ethMsg);
      expect(ethSignature,
          '18b1be8b78807d3326e28bc286d7ee3d068dcd90b1949ce1d25c1f99825f26e70992c5eb7f44f76b202aceded00d74f771ed751f2fe538eec01e338164914fe001');
      final starkPrivateKey = StarkWare.getStarkKeyFromSignature(
          starkDerivationPath!, ethSignature);
      final starkPrivateKeyData = starkPrivateKey.data;
      final starkPubKey =
          starkPrivateKey.getPublicKeyByType(PublicKeyType.Starkex);
      final starkPublicKeyData = starkPubKey.data;
      expectHex(starkPrivateKeyData,
          "04be51a04e718c202e4dca60c2b72958252024cfc1070c090dd0f170298249de");
      expectHex(starkPublicKeyData,
          "00e5b9b11f8372610ef35d647a1dcaba1a4010716588d591189b27bf3c2d5095");

      // Account register
      const ethMsgToRegister =
          'Only sign this key linking request from Immutable X';
      final ethSignatureToRegister =
          EthereumMessageSigner.signMessageImmutableX(
              ethPrivateKey, ethMsgToRegister);
      expect(ethSignatureToRegister,
          '646da4160f7fc9205e6f502fb7691a0bf63ecbb74bbb653465cd62388dd9f56325ab1e4a9aba99b1661e3e6251b42822855a71e60017b310b9f90e990a12e1dc01');
      const starkMsg =
          '463a2240432264a3aa71a5713f2a4e4c1b9e12bbb56083cd56af6d878217cf';
      final starkSignature =
          StarkExMessageSigner.signMessage(starkPrivateKey, starkMsg);
      expect(starkSignature,
          '04cf5f21333dd189ada3c0f2a51430d733501a9b1d5e07905273c1938cfb261e05b6013d74adde403e8953743a338c8d414bb96bf69d2ca1a91a85ed2700a528');
      expect(
          StarkExMessageSigner.verifyMessage(
            starkPubKey,
            starkMsg,
            starkSignature,
          ),
          true);
    });

    test('Derive_XpubPub_vs_PrivPub', () {
      // Test different routes for deriving address from mnemonic, result should be the same:
      // - Direct: mnemonic -> seed -> privateKey -> publicKey -> address
      // - Extended Public: mnemonic -> seed -> zpub -> publicKey -> address
      final wallet = HDWallet.createWithMnemonic(gWords, '');
      const coin = CoinType.Bitcoin;
      const derivPath1 = "m/84'/0'/0'/0/0";
      const derivPath2 = "m/84'/0'/0'/0/2";
      const expectedPublicKey1 =
          "02df9ef2a7a5552765178b181e1e1afdefc7849985c7dfe9647706dd4fa40df6ac";
      const expectedPublicKey2 =
          "031e1f64d2f6768dccb6814545b2e2d58e26ad5f91b7cbaffe881ed572c65060db";
      const expectedAddress1 = "bc1qpsp72plnsqe6e2dvtsetxtww2cz36ztmfxghpd";
      const expectedAddress2 = "bc1q7zddsunzaftf4zlsg9exhzlkvc5374a6v32jf6";

      // -> privateKey -> publicKey
      {
        final privateKey1 = wallet?.getKey(coin, derivPath1);
        final publicKey1 = privateKey1?.getPublicKeySecp256k1(true);
        final publicKey1Data = publicKey1?.data;
        expectHex(publicKey1Data ?? [], expectedPublicKey1);
        final address1 =
            SegwitAddress.createWithPublicKey(HRP.Bitcoin, publicKey1!);
        expect(address1.description, expectedAddress1);
      }
      {
        final privateKey2 = wallet?.getKey(coin, derivPath2);
        final publicKey2 = privateKey2?.getPublicKeySecp256k1(true);
        final publicKey2Data = publicKey2?.data;
        expectHex(publicKey2Data ?? [], expectedPublicKey2);
        final address2 =
            SegwitAddress.createWithPublicKey(HRP.Bitcoin, publicKey2!);
        expect(address2.description, expectedAddress2);
      }

      // zpub -> publicKey
      final zpub = wallet?.getExtendedPublicKey(
        Purpose.Bip84,
        coin,
        HDVersion.Zpub,
      );
      expect(zpub,
          'zpub6rNUNtxSa9Gxvm4Bdxf1MPMwrvkzwDx6vP96Hkzw3jiQKdg3fhXBStxjn12YixQB8h88B3RMSRscRstf9AEVaYr3MAqVBEWBDuEJU4PGaT9');
      {
        final publicKey1 = HDWallet.getPublicKeyFromExtended(
          zpub!,
          coin,
          derivPath1,
        );
        expect(publicKey1, isNotNull);
        final publicKey1Data = publicKey1?.data;
        expectHex(publicKey1Data ?? [], expectedPublicKey1);
        final address1 =
            SegwitAddress.createWithPublicKey(HRP.Bitcoin, publicKey1!);
        expect(address1.description, expectedAddress1);
      }
      {
        final publicKey2 = HDWallet.getPublicKeyFromExtended(
          zpub,
          coin,
          derivPath2,
        );
        expect(publicKey2, isNotNull);
        final publicKey2Data = publicKey2?.data;
        expectHex(publicKey2Data ?? [], expectedPublicKey2);
        final address2 =
            SegwitAddress.createWithPublicKey(HRP.Bitcoin, publicKey2!);
        expect(address2.description, expectedAddress2);
      }
    });
  });
}
