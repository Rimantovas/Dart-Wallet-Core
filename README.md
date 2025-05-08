# Dart Wallet Core (DWC)

Dart Wallet Core is an open-source Flutter SDK that simplifies the development of multi-chain cryptographic wallet applications. Built on the audited Trust Wallet Core C++ library, it enables developers to integrate operations like mnemonic phrase generation, key derivation, address generation, and transaction signing for multiple blockchains across Android, iOS, macOS, and Windows platforms.

## Key Features

- **Multi-chain Support**: Native support for major blockchains including Bitcoin, Ethereum, and more
- **Cross-platform Compatibility**: Works seamlessly on Android, iOS, macOS, and Windows
- **Core Functionalities**:
  - Mnemonic phrase generation and validation
  - Key derivation and management
  - Address generation for multiple chains
  - Transaction signing and verification
- **Built on Trust Wallet Core**: Leverages the audited and battle-tested Trust Wallet Core C++ library
- **Automated Code Generation**: Uses Rust-based code generation system for maintainability and consistency

## Quick Start

Add Dart Wallet Core to your `pubspec.yaml`:

```yaml
dependencies:
  dart_wallet_core: ^latest_version
```

### Library Structure

Dart Wallet Core is organized into three main packages:

- **dart_wallet_core**: The main SDK package exposing the wallet API for Flutter/Dart applications.
- **dart_wallet_core_platform**: Handles platform-specific integration and dynamic library loading for each supported OS.
- **dart_wallet_core_codegen**: Contains the code generation logic and all generated source code (FFI bindings, proto files, and API bridge code).

#### Code Generation Workflow

- **FFI Bindings**: Generated from C headers in `assets/include`.
- **Proto Files**: Generated from protocol buffer definitions in `assets/proto`.
- **API Layer (Bridge Code)**: Generated using a custom Rust-based code generator, which automates the creation of the Dart API surface and FFI bridge.

All generated code (bindings, proto, and API) can be found in:

```
packages/dart_wallet_core_codegen/lib/src/
  ├── bindings/
  ├── proto/
  └── generated/
```

### Basic Usage

Here's a simple example of creating and using an HD wallet:

```dart
import 'package:dart_wallet_core/dart_wallet_core.dart';

// Create a new HD wallet with a mnemonic
final wallet = HDWallet.createWithMnemonic(
  "ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal",
  "TREZOR" // optional passphrase
);

// Get Ethereum address
final ethAddress = wallet?.getAddressForCoin(CoinType.Ethereum);
// Returns: 0x27Ef5cDBe01777D62438AfFeb695e33fC2335979

// Get Bitcoin address
final btcAddress = wallet?.getAddressForCoin(CoinType.Bitcoin);
// Returns: bc1qumwjg8danv2vm29lp5swdux4r60ezptzz7ce85

// Get extended public key for Bitcoin
final xpub = wallet?.getExtendedPublicKey(
  Purpose.Bip44,
  CoinType.Bitcoin,
  HDVersion.Xpub
);
```

## Local Development & Code Generation

**Prerequisites:**  
Before running the code generation script, make sure you have the following installed:

- [Rust](https://www.rust-lang.org/tools/install)
- [Node.js](https://nodejs.org/)
- [Dart SDK](https://dart.dev/get-dart) (required for Dart codegen and ffigen)

After cloning this repository, you can generate all necessary bindings and API code locally by running:

```sh
./tools/scripts/generate.sh
```

This script will:

- Clean up any previously generated code.
- Generate FFI bindings from C headers (`assets/include`) using Dart's ffigen.
- Generate Dart protobuf files from protocol buffer definitions in `assets/proto`.
- Use the Rust-based code generator to produce the Dart API layer and bridge code, based on the latest Trust Wallet Core headers and proto files.

All generated code will be placed in `packages/dart_wallet_core_codegen/lib/src/` under the `bindings`, `proto`, and `generated` directories.

> **Note:** See the script for more details or troubleshooting steps.

# How to Update Trust Wallet Core Assets & Dynamic Libraries

To keep Dart Wallet Core up to date with the latest Trust Wallet Core features and fixes, you need to update both the protocol/interface assets and the native dynamic libraries.

## 1. Update Trust Wallet Core Assets

1. **Clone or fork the Trust Wallet Core repository:**

   [https://github.com/trustwallet/wallet-core](https://github.com/trustwallet/wallet-core)

2. **Follow the official build/setup instructions:**  
   (See the official documentation here: [ADD_DOCS_URL_HERE])

3. **After building Trust Wallet Core, copy the following:**

   - All `.proto` files from `wallet-core/src/protos` → `assets/proto`
   - The entire `include` directory from `wallet-core/include` → `assets/include`

   This ensures Dart Wallet Core uses the latest protocol definitions and C headers from Trust Wallet Core.

## 2. Update Dynamic Libraries

Depending on your target platform, you will need to update the native dynamic libraries as follows:

### macOS (for tests)

To build a `.dylib` file for testing on macOS:

```sh
./bootstrap.sh
```

Then, in the `common-framework.yml` file:

- Change `WalletCoreCommon` target type from `framework.static` to `framework`
- Add to dependencies:
  ```
  - sdk: Security.framework
  ```
- Add to settings:
  ```
  DEFINES_MODULE: NO
  ```

Finally, run:

```sh
./tools/ios-build
```

Upload the resulting `build/libTrustWalletCore.dylib` to `packages/dart_wallet_core/test/assets`.

### iOS and macOS (production)

iOS and macOS use the official Trust Wallet Core packages from CocoaPods.  
Just specify the desired version in iOS and macOS podspecs located in `packages/dart_wallet_core_platform`.

### Android

To build for Android, ensure that `cmake/StandardSettings.cmake` contains:

```
set(CMAKE_CXX_VISIBILITY_PRESET default)
```

Then run following commands:

```
./bootstrap.sh
./tools/android-build
```

The `android-build` will only work with certain java versions. Version 17 seems to be good.

Then upload `build/wallet-core.arr` to `test/libs`

### Windows

...
