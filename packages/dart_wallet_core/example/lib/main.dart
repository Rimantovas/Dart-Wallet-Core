import 'package:dart_wallet_core/dart_wallet_core.dart';
import 'package:dart_wallet_core_codegen/src/proto/Ethereum.pb.dart'
    as ethereum;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Core Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WalletTestScreen(title: 'Wallet Core Integration Tests'),
    );
  }
}

class WalletTestScreen extends StatefulWidget {
  const WalletTestScreen({super.key, required this.title});

  final String title;

  @override
  State<WalletTestScreen> createState() => _WalletTestScreenState();
}

class _WalletTestScreenState extends State<WalletTestScreen> {
  bool _isInitialized = false;
  TestResult? _testResult;

  @override
  void initState() {
    super.initState();
    _initializeWalletCore();
  }

  Future<void> _initializeWalletCore() async {
    try {
      WalletCore.init();
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      setState(() {
        _isInitialized = false;
        _testResult = TestResult(
          name: 'Initialization',
          success: false,
          errorMessage: e.toString(),
        );
      });
    }
  }

  Future<void> _runEthereumTest() async {
    setState(() {
      _testResult = TestResult(
        name: 'Ethereum Contract Deployment',
        isRunning: true,
      );
    });

    try {
      const coin = CoinType.Ethereum;
      final chainId = 1.serialize;
      final nonce = 11.serialize;
      final gasPrice = 20000000000.serialize;
      final gasLimit = 1000000.serialize;
      final data =
          "0x60a060405260046060527f48302e31000000000000000000000000000000000000000000000000000000006080526006805460008290527f48302e310000000000000000000000000000000000000000000000000000000882556100b5907ff652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d3f602060026001841615610100026000190190931692909204601f01919091048101905b8082111561017957600081556001016100a1565b505060405161094b38038061094b83398101604052808051906020019091908051820191906020018051906020019091908051820191906020015050836000600050600033600160a060020a0316815260200190815260200160002060005081905550836002600050819055508260036000509080519060200190828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061017d57805160ff19168380011785555b506101ad9291506100a1565b5090565b8280016001018555821561016d579182015b8281111561016d57825182600050559160200191906001019061018f565b50506004805460ff19168317905560058054825160008390527f036b6384b5eca791c62761152d0c79bb0604c104a5fb6f4eb0703f3154bb3db0602060026001851615610100026000190190941693909304601f90810184900482019386019083901061022d57805160ff19168380011785555b5061025d9291506100a1565b82800160010185558215610221579182015b8281111561022157825182600050559160200191906001019061023f565b5050505050506106da806102716000396000f36060604052361561008d5760e060020a600035046306fdde038114610095578063095ea7b3146100f357806318160ddd1461016857806323b872dd14610171578063313ce5671461025c57806354fd4d501461026857806370a08231146102c657806395d89b41146102f4578063a9059cbb14610352578063cae9ca51146103f7578063dd62ed3e146105be575b6105f2610002565b6040805160038054602060026001831615610100026000190190921691909104601f81018290048202840182019094528383526105f493908301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b61066260043560243533600160a060020a03908116600081815260016020908152604080832094871680845294825280832086905580518681529051929493927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925929181900390910190a35060015b92915050565b6102e260025481565b610662600435602435604435600160a060020a0383166000908152602081905260408120548290108015906101c4575060016020908152604080832033600160a060020a03168452909152812054829010155b80156101d05750600082115b156106bf57600160a060020a0383811660008181526020818152604080832080548801905588851680845281842080548990039055600183528184203390961684529482529182902080548790039055815186815291519293927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9281900390910190a35060016106c3565b61067660045460ff1681565b6040805160068054602060026001831615610100026000190190921691909104601f81018290048202840182019094528383526105f493908301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b600160a060020a03600435166000908152602081905260409020545b60408051918252519081900360200190f35b6105f46005805460408051602060026001851615610100026000190190941693909304601f810184900484028201840190925281815292918301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b61066260043560243533600160a060020a03166000908152602081905260408120548290108015906103845750600082115b156106ca5733600160a060020a0390811660008181526020818152604080832080548890039055938716808352918490208054870190558351868152935191937fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef929081900390910190a3506001610162565b604080516020604435600481810135601f810184900484028501840190955284845261066294813594602480359593946064949293910191819084018382808284375094965050505050505033600160a060020a03908116600081815260016020908152604080832094881680845294825280832087905580518781529051929493927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925929181900390910190a383600160a060020a031660405180807f72656365697665417070726f76616c28616464726573732c75696e743235362c81526020017f616464726573732c627974657329000000000000000000000000000000000000815260200150602e019050604051809103902060e060020a9004338530866040518560e060020a0281526004018085600160a060020a0316815260200184815260200183600160a060020a031681526020018280519060200190808383829060006004602084601f0104600f02600301f150905090810190601f1680156105965780820380516001836020036101000a031916815260200191505b509450505050506000604051808303816000876161da5a03f19250505015156106d257610002565b6102e2600435602435600160a060020a03828116600090815260016020908152604080832093851683529290522054610162565b005b60405180806020018281038252838181518152602001915080519060200190808383829060006004602084601f0104600f02600301f150905090810190601f1680156106545780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b604080519115158252519081900360200190f35b6040805160ff9092168252519081900360200190f35b820191906000526020600020905b81548152906001019060200180831161069a57829003601f168201915b505050505081565b5060005b9392505050565b506000610162565b5060016106c35600000000000000000000000000000000000000000000000000000000000003e80000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000754204275636b73000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003544f540000000000000000000000000000000000000000000000000000000000"
              .hexToBytes();
      final key =
          "0x4646464646464646464646464646464646464646464646464646464646464646"
              .hexToBytes();

      final input = ethereum.SigningInput(
        chainId: chainId,
        nonce: nonce,
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        privateKey: key,
        transaction: ethereum.Transaction(
          contractGeneric: ethereum.Transaction_ContractGeneric(
            data: data,
          ),
        ),
      );

      const expected =
          'f90a9e0b8504a817c800830f42408080b90a4b60a060405260046060527f48302e31000000000000000000000000000000000000000000000000000000006080526006805460008290527f48302e310000000000000000000000000000000000000000000000000000000882556100b5907ff652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d3f602060026001841615610100026000190190931692909204601f01919091048101905b8082111561017957600081556001016100a1565b505060405161094b38038061094b83398101604052808051906020019091908051820191906020018051906020019091908051820191906020015050836000600050600033600160a060020a0316815260200190815260200160002060005081905550836002600050819055508260036000509080519060200190828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061017d57805160ff19168380011785555b506101ad9291506100a1565b5090565b8280016001018555821561016d579182015b8281111561016d57825182600050559160200191906001019061018f565b50506004805460ff19168317905560058054825160008390527f036b6384b5eca791c62761152d0c79bb0604c104a5fb6f4eb0703f3154bb3db0602060026001851615610100026000190190941693909304601f90810184900482019386019083901061022d57805160ff19168380011785555b5061025d9291506100a1565b82800160010185558215610221579182015b8281111561022157825182600050559160200191906001019061023f565b5050505050506106da806102716000396000f36060604052361561008d5760e060020a600035046306fdde038114610095578063095ea7b3146100f357806318160ddd1461016857806323b872dd14610171578063313ce5671461025c57806354fd4d501461026857806370a08231146102c657806395d89b41146102f4578063a9059cbb14610352578063cae9ca51146103f7578063dd62ed3e146105be575b6105f2610002565b6040805160038054602060026001831615610100026000190190921691909104601f81018290048202840182019094528383526105f493908301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b61066260043560243533600160a060020a03908116600081815260016020908152604080832094871680845294825280832086905580518681529051929493927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925929181900390910190a35060015b92915050565b6102e260025481565b610662600435602435604435600160a060020a0383166000908152602081905260408120548290108015906101c4575060016020908152604080832033600160a060020a03168452909152812054829010155b80156101d05750600082115b156106bf57600160a060020a0383811660008181526020818152604080832080548801905588851680845281842080548990039055600183528184203390961684529482529182902080548790039055815186815291519293927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9281900390910190a35060016106c3565b61067660045460ff1681565b6040805160068054602060026001831615610100026000190190921691909104601f81018290048202840182019094528383526105f493908301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b600160a060020a03600435166000908152602081905260409020545b60408051918252519081900360200190f35b6105f46005805460408051602060026001851615610100026000190190941693909304601f810184900484028201840190925281815292918301828280156106b75780601f1061068c576101008083540402835291602001916106b7565b61066260043560243533600160a060020a03166000908152602081905260408120548290108015906103845750600082115b156106ca5733600160a060020a0390811660008181526020818152604080832080548890039055938716808352918490208054870190558351868152935191937fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef929081900390910190a3506001610162565b604080516020604435600481810135601f810184900484028501840190955284845261066294813594602480359593946064949293910191819084018382808284375094965050505050505033600160a060020a03908116600081815260016020908152604080832094881680845294825280832087905580518781529051929493927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925929181900390910190a383600160a060020a031660405180807f72656365697665417070726f76616c28616464726573732c75696e743235362c81526020017f616464726573732c627974657329000000000000000000000000000000000000815260200150602e019050604051809103902060e060020a9004338530866040518560e060020a0281526004018085600160a060020a0316815260200184815260200183600160a060020a031681526020018280519060200190808383829060006004602084601f0104600f02600301f150905090810190601f1680156105965780820380516001836020036101000a031916815260200191505b509450505050506000604051808303816000876161da5a03f19250505015156106d257610002565b6102e2600435602435600160a060020a03828116600090815260016020908152604080832093851683529290522054610162565b005b60405180806020018281038252838181518152602001915080519060200190808383829060006004602084601f0104600f02600301f150905090810190601f1680156106545780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b604080519115158252519081900360200190f35b6040805160ff9092168252519081900360200190f35b820191906000526020600020905b81548152906001019060200180831161069a57829003601f168201915b505050505081565b5060005b9392505050565b506000610162565b5060016106c35600000000000000000000000000000000000000000000000000000000000003e80000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000754204275636b73000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003544f54000000000000000000000000000000000000000000000000000000000026a042556c4f2a3f4e4e639cca524d1da70e60881417d4643e5382ed110a52719eafa0172f591a2a763d0bd6b13d042d8c5eb66e87f129c9dc77ada66b6041012db2b3';

      // Sign the transaction
      final output = AnySigner.sign(
          input, coin, (value) => ethereum.SigningOutput.fromBuffer(value));

      final success =
          output.encoded.hexString == expected.replaceFirst('0x', '');

      setState(() {
        _testResult = TestResult(
          name: 'Ethereum Contract Deployment',
          success: success,
          result: 'Encoded Transaction: ${output.encoded.hexString}',
        );
      });
    } catch (e) {
      setState(() {
        _testResult = TestResult(
          name: 'Ethereum Contract Deployment',
          success: false,
          errorMessage: e.toString(),
        );
      });
    }
  }

  Future<void> _createWalletTest() async {
    setState(() {
      _testResult = TestResult(
        name: 'Create New Wallet',
        isRunning: true,
      );
    });

    try {
      // Generate a new wallet with 128-bit entropy
      final wallet = HDWallet.create(128, "");
      final isValid = Mnemonic.isValid(wallet?.mnemonic ?? '');

      setState(() {
        _testResult = TestResult(
          name: 'Create New Wallet',
          success: isValid,
          result: 'Generated mnemonic: ${wallet?.mnemonic}',
        );
      });
    } catch (e) {
      setState(() {
        _testResult = TestResult(
          name: 'Create New Wallet',
          success: false,
          errorMessage: e.toString(),
        );
      });
    }
  }

  Future<void> _importWalletTest() async {
    setState(() {
      _testResult = TestResult(
        name: 'Import Wallet',
        isRunning: true,
      );
    });

    try {
      const mnemonic =
          "ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal";
      const passphrase = "TREZOR";
      const expectedSeedHex =
          "7ae6f661157bda6492f6162701e570097fc726b6235011ea5ad09bf04986731ed4d92bc43cbdee047b60ea0dd1b1fa4274377c9bf5bd14ab1982c272d8076f29";
      const expectedEntropyHex = "ba5821e8c356c05ba5f025d9532fe0f21f65d594";

      final wallet = HDWallet.createWithMnemonic(mnemonic, passphrase);
      final seedMatches =
          (wallet?.seed.toList() ?? []).hexString == expectedSeedHex;
      final entropyMatches =
          (wallet?.entropy.toList() ?? []).hexString == expectedEntropyHex;

      setState(() {
        _testResult = TestResult(
          name: 'Import Wallet',
          success: seedMatches && entropyMatches,
          result:
              'Mnemonic: $mnemonic\nSeed matches: $seedMatches\nEntropy matches: $entropyMatches',
        );
      });
    } catch (e) {
      setState(() {
        _testResult = TestResult(
          name: 'Import Wallet',
          success: false,
          errorMessage: e.toString(),
        );
      });
    }
  }

  Future<void> _deriveAddressTest() async {
    setState(() {
      _testResult = TestResult(
        name: 'Derive Address',
        isRunning: true,
      );
    });

    try {
      const mnemonic =
          "ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal";
      const passphrase = "TREZOR";

      final wallet = HDWallet.createWithMnemonic(mnemonic, passphrase);

      // Derive Bitcoin address (Segwit)
      final btcAddress = wallet?.getAddressForCoin(CoinType.Bitcoin);
      final expectedBtcAddress = "bc1qumwjg8danv2vm29lp5swdux4r60ezptzz7ce85";
      final btcMatches = btcAddress == expectedBtcAddress;

      // Derive Ethereum address
      final ethAddress = wallet?.getAddressForCoin(CoinType.Ethereum);
      final expectedEthAddress = "0x27Ef5cDBe01777D62438AfFeb695e33fC2335979";
      final ethMatches = ethAddress == expectedEthAddress;

      setState(() {
        _testResult = TestResult(
          name: 'Derive Address',
          success: btcMatches && ethMatches,
          result:
              'Bitcoin address: $btcAddress\nExpected: $expectedBtcAddress\nMatches: $btcMatches\n\nEthereum address: $ethAddress\nExpected: $expectedEthAddress\nMatches: $ethMatches',
        );
      });
    } catch (e) {
      setState(() {
        _testResult = TestResult(
          name: 'Derive Address',
          success: false,
          errorMessage: e.toString(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallet Core Status',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Library Initialized: '),
                          _isInitialized
                              ? const Icon(Icons.check_circle,
                                  color: Colors.green)
                              : const Icon(Icons.error, color: Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Available Tests',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  ElevatedButton.icon(
                    key: Key('ethereum_test_button'),
                    onPressed: _isInitialized ? _runEthereumTest : null,
                    icon: const Icon(Icons.send),
                    label: const Text('Ethereum Transaction Test'),
                  ),
                  ElevatedButton.icon(
                    key: Key('create_wallet_button'),
                    onPressed: _isInitialized ? _createWalletTest : null,
                    icon: const Icon(Icons.add),
                    label: const Text('Create Wallet Test'),
                  ),
                  ElevatedButton.icon(
                    key: Key('import_wallet_button'),
                    onPressed: _isInitialized ? _importWalletTest : null,
                    icon: const Icon(Icons.file_download),
                    label: const Text('Import Wallet Test'),
                  ),
                  ElevatedButton.icon(
                    key: Key('derive_address_button'),
                    onPressed: _isInitialized ? _deriveAddressTest : null,
                    icon: const Icon(Icons.account_balance_wallet),
                    label: const Text('Derive Address Test'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_testResult != null) ...[
                Text(
                  'Test Results',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                _TestResultCard(testResult: _testResult!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class TestResult {
  final String name;
  final bool success;
  final bool isRunning;
  final String? result;
  final String? errorMessage;

  TestResult({
    required this.name,
    this.success = false,
    this.isRunning = false,
    this.result,
    this.errorMessage,
  });
}

class _TestResultCard extends StatelessWidget {
  final TestResult testResult;

  const _TestResultCard({required this.testResult});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  testResult.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                if (testResult.isRunning)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else if (testResult.success)
                  const Icon(Icons.check_circle, color: Colors.green)
                else
                  const Icon(Icons.error, color: Colors.red),
              ],
            ),
            const SizedBox(height: 8),
            if (testResult.success && !testResult.isRunning) ...[
              Text('TESTING true', style: const TextStyle(color: Colors.green)),
              if (testResult.result != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    testResult.result!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ] else if (!testResult.isRunning &&
                testResult.errorMessage != null) ...[
              Text(
                'Error: ${testResult.errorMessage}',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
