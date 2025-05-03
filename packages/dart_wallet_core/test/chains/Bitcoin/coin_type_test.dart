import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBitcoinCoinType', () {
    test('CoinType', () {
      const coin = CoinType.Bitcoin;
      final symbol = CoinTypeConfiguration.getSymbol(coin);
      final id = CoinTypeConfiguration.getId(coin);
      final name = CoinTypeConfiguration.getName(coin);
      const txId =
          '0607f62530b68cfcc91c57a1702841dd399a899d0eecda8e31ecca3f52f01df2';
      final txUrl = CoinTypeConfiguration.getTransactionUrl(coin, txId);
      const accId = '17A16QmavnUfCW11DAApiJxp7ARnxN5pGX';
      final accUrl = CoinTypeConfiguration.getAccountUrl(coin, accId);

      expect(id, 'bitcoin');
      expect(name, 'Bitcoin');
      expect(symbol, 'BTC');
      expect(CoinTypeConfiguration.getDecimals(coin), 8);
      expect(coin.blockchain, Blockchain.Bitcoin);
      expect(coin.p2shPrefix, 0x5);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://mempool.space/tx/0607f62530b68cfcc91c57a1702841dd399a899d0eecda8e31ecca3f52f01df2');
      expect(accUrl,
          'https://mempool.space/address/17A16QmavnUfCW11DAApiJxp7ARnxN5pGX');
    });
  });
}
