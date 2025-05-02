import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

void main() {
  initTest();

  group('EthereumCoinType', () {
    test('CoinType', () {
      const coin = CoinType.Ethereum;
      final symbol = CoinTypeConfiguration.getSymbol(coin);
      final id = CoinTypeConfiguration.getId(coin);
      final name = CoinTypeConfiguration.getName(coin);
      const txId =
          '0x9edaf0f7d9c6629c31bbf0471fc07d696c73b566b93783f7e25d8d5d2b62fa4f';
      final txUrl = CoinTypeConfiguration.getTransactionUrl(coin, txId);
      const accId = '0x5bb497e8d9fe26e92dd1be01e32076c8e024d167';
      final accUrl = CoinTypeConfiguration.getAccountUrl(coin, accId);
      final chainId = coin.chainId;

      expect(id, 'ethereum');
      expect(name, 'Ethereum');
      expect(symbol, 'ETH');
      expect(chainId, '1');
      expect(CoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, Blockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://etherscan.io/tx/0x9edaf0f7d9c6629c31bbf0471fc07d696c73b566b93783f7e25d8d5d2b62fa4f');
      expect(accUrl,
          'https://etherscan.io/address/0x5bb497e8d9fe26e92dd1be01e32076c8e024d167');
    });
  });
}
