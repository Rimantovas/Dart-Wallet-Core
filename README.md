# Trust wallet dart

This package has 3 parts:

- Rust code generator
- C header bindings generator
- Util classes

## Rust code generator

Located in `codegen-dart`

It generates dart code based on yaml files in `codegen-dart/manifest`

Copies the code to `lib/generated`

## C header bindings generator

Located in `gen`

Generates dart bindings from C headers located in `gen/headers`

Copies the code to `lib/bindings`

## Util classes

Located in `lib/sources`

Utility classes created for rust generated dart code

# How to update trust wallet dart

Update manifest files (`codegen-dart/manifest`)

Update C headers (`gen/headers`)

## Updating/building package versions

### TESTS (macOS)

To build a .dylib file run the following commands:

```
./bootstrap.sh
```

Then find `common-framework.yml` file and following:

- Change WalletCoreCommon target type from `framework.static` to `framework`

- To dependancies add:

```
- sdk: Security.framework
```

- To settings add:

```
DEFINES_MODULE: NO
```

Lastly, run the following script:

```
./tools/ios-build
```

Then upload `build/libTrustWalletCore.dylib` to `test/libs`

NOTE: Currently some cases will fail in tests while working in production. Best example of this is trying to create HDWallet with a spanish mnemonic

### iOS and macOS

iOS and macOS uses the official trust wallet core packages from cocoapods. Just specify the version in iOS and macOS podspecs

### Android

To build android first make sure that `cmake/StandardSettings.cmake` has `set(CMAKE_CXX_VISIBILITY_PRESET default)`. Then run following commands:

```
./bootstrap.sh
./tools/android-build
```

The `android-build` will only work with certain java versions. Version 17 seems to be good.

Then upload `build/wallet-core.arr` to `test/libs`

### Windows

...

# Last trust wallet core commit

94116a2: Update Polkadot signature encoding to support spec 1002005 (#3897) …
