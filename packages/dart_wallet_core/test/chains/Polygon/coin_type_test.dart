import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('PolygonCoinType', () {
    test('CoinType', () {
      const coin = CoinType.Polygon;
      final symbol = CoinTypeConfiguration.getSymbol(coin);
      final id = CoinTypeConfiguration.getId(coin);
      final name = CoinTypeConfiguration.getName(coin);
      const txId =
          '0xe26ed1470d5bf99a53d687843e7acdf7e4ba6620af93b4d672e714de90476e8e';
      final txUrl = CoinTypeConfiguration.getTransactionUrl(coin, txId);
      const accId = '0x720E1fa107A1Df39Db4E78A3633121ac36Bec132';
      final accUrl = CoinTypeConfiguration.getAccountUrl(coin, accId);

      expect(id, 'polygon');
      expect(name, 'Polygon');
      expect(symbol, 'POL');
      expect(CoinTypeConfiguration.getDecimals(coin), 18);
      expect(coin.blockchain, Blockchain.Ethereum);
      expect(coin.p2shPrefix, 0x0);
      expect(coin.staticPrefix, 0x0);
      expect(txUrl,
          'https://polygonscan.com/tx/0xe26ed1470d5bf99a53d687843e7acdf7e4ba6620af93b4d672e714de90476e8e');
      expect(accUrl,
          'https://polygonscan.com/address/0x720E1fa107A1Df39Db4E78A3633121ac36Bec132');
    });
  });
}
