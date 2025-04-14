part of '../generated.dart';
enum EthereumChainID {
    Ethereum(1),
    Classic(61),
    Poa(99),
    Vechain(74),
    Callisto(820),
    Tomochain(88),
    Polygon(137),
    Okc(66),
    Thundertoken(108),
    Gochain(60),
    Meter(82),
    Celo(42220),
    Wanchain(888),
    Cronos(25),
    Optimism(10),
    Xdai(100),
    Smartbch(10000),
    Fantom(250),
    Boba(288),
    Kcc(321),
    Zksync(324),
    Heco(128),
    Metis(1088),
    Polygonzkevm(1101),
    Moonbeam(1284),
    Moonriver(1285),
    Ronin(2020),
    Kavaevm(2222),
    Iotexevm(4689),
    Kaia(8217),
    Avalanchec(43114),
    Evmos(9001),
    Arbitrum(42161),
    Smartchain(56),
    Aurora(1313161554),
    ;

    final int value;
    const EthereumChainID(this.value);

    static EthereumChainID? fromValue(int value) {
        switch (value) {
            case 1:
                return EthereumChainID.Ethereum;
            case 61:
                return EthereumChainID.Classic;
            case 99:
                return EthereumChainID.Poa;
            case 74:
                return EthereumChainID.Vechain;
            case 820:
                return EthereumChainID.Callisto;
            case 88:
                return EthereumChainID.Tomochain;
            case 137:
                return EthereumChainID.Polygon;
            case 66:
                return EthereumChainID.Okc;
            case 108:
                return EthereumChainID.Thundertoken;
            case 60:
                return EthereumChainID.Gochain;
            case 82:
                return EthereumChainID.Meter;
            case 42220:
                return EthereumChainID.Celo;
            case 888:
                return EthereumChainID.Wanchain;
            case 25:
                return EthereumChainID.Cronos;
            case 10:
                return EthereumChainID.Optimism;
            case 100:
                return EthereumChainID.Xdai;
            case 10000:
                return EthereumChainID.Smartbch;
            case 250:
                return EthereumChainID.Fantom;
            case 288:
                return EthereumChainID.Boba;
            case 321:
                return EthereumChainID.Kcc;
            case 324:
                return EthereumChainID.Zksync;
            case 128:
                return EthereumChainID.Heco;
            case 1088:
                return EthereumChainID.Metis;
            case 1101:
                return EthereumChainID.Polygonzkevm;
            case 1284:
                return EthereumChainID.Moonbeam;
            case 1285:
                return EthereumChainID.Moonriver;
            case 2020:
                return EthereumChainID.Ronin;
            case 2222:
                return EthereumChainID.Kavaevm;
            case 4689:
                return EthereumChainID.Iotexevm;
            case 8217:
                return EthereumChainID.Kaia;
            case 43114:
                return EthereumChainID.Avalanchec;
            case 9001:
                return EthereumChainID.Evmos;
            case 42161:
                return EthereumChainID.Arbitrum;
            case 56:
                return EthereumChainID.Smartchain;
            case 1313161554:
                return EthereumChainID.Aurora;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
