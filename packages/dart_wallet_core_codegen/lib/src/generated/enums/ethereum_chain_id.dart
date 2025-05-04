part of '../generated.dart';
enum EthereumChainID {
    Ethereum(1),
    Classic(61),
    Rootstock(30),
    Manta(169),
    Poa(99),
    Opbnb(204),
    Tfuelevm(361),
    Vechain(74),
    Callisto(820),
    Viction(88),
    Polygon(137),
    Okc(66),
    Thundertoken(108),
    Cfxevm(1030),
    Lightlink(1890),
    Merlin(4200),
    Mantle(5000),
    Bouncebit(6001),
    Gochain(60),
    Zeneon(7332),
    Base(8453),
    Meter(82),
    Celo(42220),
    Linea(59144),
    Blast(81457),
    Scroll(534352),
    Zklinknova(810180),
    Wanchain(888),
    Cronos(25),
    Optimism(10),
    Xdai(100),
    Smartbch(10000),
    Sonic(146),
    Fantom(250),
    Boba(288),
    Kcc(321),
    Zksync(324),
    Heco(128),
    Acalaevm(787),
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
    Arbitrumnova(42170),
    Arbitrum(42161),
    Smartchain(56),
    Zetaevm(7000),
    Neon(245022934),
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
            case 30:
                return EthereumChainID.Rootstock;
            case 169:
                return EthereumChainID.Manta;
            case 99:
                return EthereumChainID.Poa;
            case 204:
                return EthereumChainID.Opbnb;
            case 361:
                return EthereumChainID.Tfuelevm;
            case 74:
                return EthereumChainID.Vechain;
            case 820:
                return EthereumChainID.Callisto;
            case 88:
                return EthereumChainID.Viction;
            case 137:
                return EthereumChainID.Polygon;
            case 66:
                return EthereumChainID.Okc;
            case 108:
                return EthereumChainID.Thundertoken;
            case 1030:
                return EthereumChainID.Cfxevm;
            case 1890:
                return EthereumChainID.Lightlink;
            case 4200:
                return EthereumChainID.Merlin;
            case 5000:
                return EthereumChainID.Mantle;
            case 6001:
                return EthereumChainID.Bouncebit;
            case 60:
                return EthereumChainID.Gochain;
            case 7332:
                return EthereumChainID.Zeneon;
            case 8453:
                return EthereumChainID.Base;
            case 82:
                return EthereumChainID.Meter;
            case 42220:
                return EthereumChainID.Celo;
            case 59144:
                return EthereumChainID.Linea;
            case 81457:
                return EthereumChainID.Blast;
            case 534352:
                return EthereumChainID.Scroll;
            case 810180:
                return EthereumChainID.Zklinknova;
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
            case 146:
                return EthereumChainID.Sonic;
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
            case 787:
                return EthereumChainID.Acalaevm;
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
            case 42170:
                return EthereumChainID.Arbitrumnova;
            case 42161:
                return EthereumChainID.Arbitrum;
            case 56:
                return EthereumChainID.Smartchain;
            case 7000:
                return EthereumChainID.Zetaevm;
            case 245022934:
                return EthereumChainID.Neon;
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
