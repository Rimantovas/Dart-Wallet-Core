import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

void main() {
  initTest();

  group('AnyAddress', () {
    test('Invalid string', () {
      const string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
      final btcAddress = AnyAddress.createWithString(string, CoinType.Bitcoin);
      final ethAddress = AnyAddress.createWithString(string, CoinType.Ethereum);

      expect(btcAddress, isNull);
      expect(ethAddress, isNotNull);
      expect(ethAddress?.coin, CoinType.Ethereum);
    });

    test('Data', () {
      // ethereum
      {
        const string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
        final addr = AnyAddress.createWithString(string, CoinType.Ethereum);
        expectHex(addr?.data, '4e5b2e1dc63f6b91cb6cd759936495434c7e972f');
      }

      // smartBCH
      {
        const string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
        final addr =
            AnyAddress.createWithString(string, CoinType.SmartBitcoinCash);
        expectHex(addr?.data, '4e5b2e1dc63f6b91cb6cd759936495434c7e972f');
      }

      // KuCoin Community Chain
      {
        const string = '0x4E5B2e1dc63F6b91cb6Cd759936495434C7e972F';
        final addr =
            AnyAddress.createWithString(string, CoinType.KuCoinCommunityChain);
        expectHex(addr?.data, '4e5b2e1dc63f6b91cb6cd759936495434c7e972f');
      }

      // bnb address key hash
      {
        const string = 'bnb1hlly02l6ahjsgxw9wlcswnlwdhg4xhx38yxpd5';
        final addr = AnyAddress.createWithString(string, CoinType.Binance);
        expectHex(addr?.data, 'bffe47abfaede50419c577f1074fee6dd1535cd1');
      }

      // bitcoin segwit witness program
      {
        const string = 'bc1qw508d6qejxtdg4y5r3zarvary0c5xw7kv8f3t4';
        final addr = AnyAddress.createWithString(string, CoinType.Bitcoin);
        expectHex(addr?.data, '751e76e8199196d454941c45d1b3a323f1433bd6');
      }

      // bitcoin taproot (segwit v1, bech32m)
      {
        const string =
            'bc1pw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7kt5nd6y';
        final addr = AnyAddress.createWithString(string, CoinType.Bitcoin);
        expectHex(addr?.data,
            '751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d454941c45d1b3a323f1433bd6');
      }

      // bitcoincashaddr
      {
        const string = 'bitcoincash:qzxf0wl63ahx6jsxu8uuldcw7n5aatwppvnteraqaw';
        final addr = AnyAddress.createWithString(string, CoinType.BitcoinCash);
        expectHex(addr?.data, '8c97bbfa8f6e6d4a06e1f9cfb70ef4e9deadc10b');
      }

      // base58 dogecoin
      {
        const string = 'DQkiL71KkuGEgS9QFCKJkBeHmzM5YFYGkG';
        final addr = AnyAddress.createWithString(string, CoinType.Dogecoin);
        expectHex(addr?.data, 'd726d32d9ff0560e7df35764987fcf01a6a343cf');
      }

      // decred
      {
        const string = 'Dsb4fb7SfdLPhKVQFapGRGnokncgNiYmkAe';
        final addr = AnyAddress.createWithString(string, CoinType.Decred);
        expectHex(addr?.data, '6ec8261586091a51ea706a62161eceba4b583b49');
      }

      // zcash
      {
        const string = 't3PkLgT71TnF112nSwBToXsD77yNbx2gJJY';
        final addr = AnyAddress.createWithString(string, CoinType.Zcash);
        expectHex(addr?.data, '38dfa4066f0032c86024bb5899adfa167c80189c');
      }

      // nano
      {
        const string =
            'nano_1ie9ffzo57nh51p53eaiqen8y6mxe1z5etcnpmucyts77qk7mqzm1x7yiyjk';
        final addr = AnyAddress.createWithString(string, CoinType.Nano);
        expectHex(addr?.data,
            '41876b7f51968f182c30b110bb286f127d603e366954b4f6af6b252de459dff3');
      }

      // kusama
      {
        const string = 'HewiDTQv92L2bVtkziZC8ASxrFUxr6ajQ62RXAnwQ8FDVmg';
        final addr = AnyAddress.createWithString(string, CoinType.Kusama);
        expectHex(addr?.data,
            'e0b3fcccfe0283cc0f8c105c68b5690aab8c5c1692a868e55eaca836c8779085');
      }

      // polkadot
      {
        const string = '16fir1SPRAaWGtF4ZkKNDq3S6LnD9mbphGXqL923DoH85Exz';
        final addr = AnyAddress.createWithString(string, CoinType.Polkadot);
        expectHex(addr?.data,
            'fab55af5eaaa1a284b615946dc3dd403c44ce3448c15884d61b2dcba3ddb245a');
      }

      // cardano
      {
        const string =
            'addr1q8043m5heeaydnvtmmkyuhe6qv5havvhsf0d26q3jygsspxlyfpyk6yqkw0yhtyvtr0flekj84u64az82cufmqn65zdsylzk23';
        final addr = AnyAddress.createWithString(string, CoinType.Cardano);
        expectHex(addr?.data,
            '01df58ee97ce7a46cd8bdeec4e5f3a03297eb197825ed5681191110804df22424b6880b39e4bac8c58de9fe6d23d79aaf44756389d827aa09b');
      }

      // neo
      {
        const string = 'AKmrAHRD9ZDUnu4m3vWWonpsojo4vgSuqp';
        final addr = AnyAddress.createWithString(string, CoinType.Neo);
        expectHex(addr?.data, '172bdf43265c0adfe105a1a8c45b3f406a38362f24');
      }

      // multiversx
      {
        const string =
            'erd1l453hd0gt5gzdp7czpuall8ggt2dcv5zwmfdf3sd3lguxseux2fsmsgldz';
        final addr = AnyAddress.createWithString(string, CoinType.MultiversX);
        expectHex(addr?.data,
            'fd691bb5e85d102687d81079dffce842d4dc328276d2d4c60d8fd1c3433c3293');
      }

      // near
      {
        const string = 'NEARTDDWrUMdoC2rA1eU6gNrSU2zyGKdR71TNucTvsQHyfAXjKcJb';
        final addr = AnyAddress.createWithString(string, CoinType.Near);
        expectHex(addr?.data,
            '3b83b07cab54824a59c3d3f2e203a7cd913b7fcdc4439595983e2402c2cf791d');
      }

      // ecashaddr
      {
        const string = 'ecash:qzxf0wl63ahx6jsxu8uuldcw7n5aatwppv2xdgx6me';
        final addr = AnyAddress.createWithString(string, CoinType.Ecash);
        expectHex(addr?.data, '8c97bbfa8f6e6d4a06e1f9cfb70ef4e9deadc10b');
      }

      // solana
      {
        const string = '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST';
        final addr = AnyAddress.createWithString(string, CoinType.Solana);
        expectHex(addr?.data,
            '18f9d8d877393bbbe8d697a8a2e52879cc7e84f467656d1cce6bab5a8d2637ec');
      }
    });

    test('createFromPubKey', () {
      const pubkey =
          '02753f5c275e1847ba4d2fd3df36ad00af2e165650b35fe3991e9c9c46f68b12bc';
      final pubkeyObj = PublicKey.createWithData(
          pubkey.hexToBytes(), PublicKeyType.Secp256k1);

      if (pubkeyObj == null) {
        throw Exception('Failed to create public key');
      }

      final addr = AnyAddress.createWithPublicKey(pubkeyObj, CoinType.Bitcoin);
      expect(addr.description, 'bc1qcj2vfjec3c3luf9fx9vddnglhh9gawmncmgxhz');
    });

    test('createFromPubKeyDerivationBitcoin', () {
      const pubkey =
          '02753f5c275e1847ba4d2fd3df36ad00af2e165650b35fe3991e9c9c46f68b12bc';
      final pubkeyObj = PublicKey.createWithData(
          pubkey.hexToBytes(), PublicKeyType.Secp256k1);

      if (pubkeyObj == null) {
        throw Exception('Failed to create public key');
      }

      {
        final addr = AnyAddress.createWithPublicKeyDerivation(
          pubkeyObj,
          CoinType.Bitcoin,
          Derivation.Default,
        );
        expect(addr.description, 'bc1qcj2vfjec3c3luf9fx9vddnglhh9gawmncmgxhz');
      }

      {
        final addr = AnyAddress.createWithPublicKeyDerivation(
          pubkeyObj,
          CoinType.Bitcoin,
          Derivation.BitcoinLegacy,
        );
        expect(addr.description, '1JvRfEQFv5q5qy9uTSAezH7kVQf4hqnHXx');
      }

      {
        final addr = AnyAddress.createWithPublicKeyDerivation(
          pubkeyObj,
          CoinType.Bitcoin,
          Derivation.BitcoinTestnet,
        );
        expect(addr.description, 'tb1qcj2vfjec3c3luf9fx9vddnglhh9gawmnjan4v3');
      }
    });

    test('createFromPubKeyDerivationPactus', () {
      const pubkey =
          "95794161374b22c696dabb98e93f6ca9300b22f3b904921fbf560bb72145f4fa";
      final pubkeyObj = PublicKey.createWithData(
        pubkey.hexToBytes(),
        PublicKeyType.Ed25519,
      );

      if (pubkeyObj == null) {
        throw Exception('Failed to create public key');
      }

      {
        final addr = AnyAddress.createWithPublicKeyDerivation(
          pubkeyObj,
          CoinType.Pactus,
          Derivation.Default,
        );
        expect(addr.description, 'pc1rwzvr8rstdqypr80ag3t6hqrtnss9nwymcxy3lr');
      }

      {
        final addr = AnyAddress.createWithPublicKeyDerivation(
          pubkeyObj,
          CoinType.Pactus,
          Derivation.PactusMainnet,
        );
        expect(addr.description, 'pc1rwzvr8rstdqypr80ag3t6hqrtnss9nwymcxy3lr');
      }

      {
        final addr = AnyAddress.createWithPublicKeyDerivation(
          pubkeyObj,
          CoinType.Pactus,
          Derivation.PactusTestnet,
        );
        expect(addr.description, 'tpc1rwzvr8rstdqypr80ag3t6hqrtnss9nwymzqkcrg');
      }
    });

    test('createFromPubKeyFilecoinAddressType', () {
      const pubkey =
          '0419bf99082cf2fcdaa812d6eba1eba9036ff3a3d84c1817c84954d4e8ae283fec5313e427a0f5f68dec3169b2eda876b1d9f97b1ede7f958baee6a2ce78f6e94a';

      final pubkeyObj = PublicKey.createWithData(
          pubkey.hexToBytes(), PublicKeyType.Secp256k1extended);

      if (pubkeyObj == null) {
        throw Exception('Failed to create public key');
      }

      {
        final addr = AnyAddress.createWithPublicKeyFilecoinAddressType(
            pubkeyObj, FilecoinAddressType.Default);
        final actual = addr.description;
        expect(actual, 'f1syn25x7infncgfvodhriq2dudvmudabtavm3wyy');
        expect(AnyAddress.isValid(actual, CoinType.Filecoin), true);
      }

      {
        final addr = AnyAddress.createWithPublicKeyFilecoinAddressType(
            pubkeyObj, FilecoinAddressType.Delegated);
        final actual = addr.description;
        expect(actual, 'f410fvak24cyg3saddajborn6idt7rrtfj2ptauk5pbq');
        expect(AnyAddress.isValid(actual, CoinType.Filecoin), true);
      }
    });
  });
}
