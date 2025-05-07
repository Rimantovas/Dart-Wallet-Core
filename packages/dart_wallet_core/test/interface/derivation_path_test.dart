import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils.dart';

void main() {
  initTest();

  group('DerivationPath', () {
    test('CreateWithString', () {
      const derivationPath = "m/84'/1'/2'/3/4";

      final path = DerivationPath.createWithString(derivationPath);

      if (path == null) {
        throw Exception('Failed to create derivation path');
      }

      expect(5, path.indicesCount());
      expect(Purpose.Bip84, path.purpose);
      expect(1, path.coin);
      expect(2, path.account);
      expect(3, path.change);
      expect(4, path.address);
      expect(path.description, derivationPath);

      final index0 = path.indexAt(0);
      final index3 = path.indexAt(3);

      expect(path.indexAt(10), isNull);
      expect(Purpose.Bip84.value, index0?.value);
      expect(index0?.hardened, true);

      expect(3, index3?.value);
      expect(index3?.hardened, false);
      expect(index0?.description, "84'");

      final path2 = DerivationPath.createWithString("m/44'/501'");

      if (path2 == null) {
        throw Exception('Failed to create derivation path');
      }

      expect(2, path2.indicesCount());
      expect(Purpose.Bip44, path2.purpose);
      expect(501, path2.coin);
      expect(0, path2.account);
      expect(0, path2.change);
      expect(0, path2.address);
    });

    test('CreateWithCoin', () {
      final path = DerivationPath.create(
        Purpose.Bip44,
        60,
        0,
        0,
        0,
      );

      expect(5, path.indicesCount());
      expect(Purpose.Bip44, path.purpose);
      expect(60, path.coin);
      expect(0, path.account);
      expect(0, path.change);
      expect(0, path.address);
      expect(path.description, "m/44'/60'/0'/0/0");

      final index = DerivationPathIndex.create(44, true);
      final description = index.description;
      expect(description, "44'");
    });
  });
}
