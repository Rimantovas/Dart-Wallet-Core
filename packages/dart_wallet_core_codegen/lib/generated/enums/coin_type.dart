part of '../generated.dart';
enum CoinType {
    Aeternity(457),
    Aion(425),
    Binance(714),
    Bitcoin(0),
    BitcoinCash(145),
    BitcoinGold(156),
    Callisto(820),
    Cardano(1815),
    Cosmos(118),
    Pivx(119),
    Dash(5),
    Decred(42),
    DigiByte(20),
    Dogecoin(3),
    Eos(194),
    Wax(14001),
    Ethereum(60),
    EthereumClassic(61),
    Fio(235),
    GoChain(6060),
    Groestlcoin(17),
    Icon(74),
    IoTeX(304),
    Kava(459),
    Kin(2017),
    Litecoin(2),
    Monacoin(22),
    Nebulas(2718),
    Nuls(8964),
    Nano(165),
    Near(397),
    Nimiq(242),
    Ontology(1024),
    Poanetwork(178),
    Qtum(2301),
    Xrp(144),
    Solana(501),
    Stellar(148),
    Tezos(1729),
    Theta(500),
    ThunderCore(1001),
    Neo(888),
    Viction(889),
    Tron(195),
    VeChain(818),
    Viacoin(14),
    Wanchain(5718350),
    Zcash(133),
    Firo(136),
    Zilliqa(313),
    Zelcash(19167),
    Ravencoin(175),
    Waves(5741564),
    Terra(330),
    TerraV2(10000330),
    Harmony(1023),
    Algorand(283),
    Kusama(434),
    Polkadot(354),
    Filecoin(461),
    MultiversX(508),
    BandChain(494),
    SmartChainLegacy(10000714),
    SmartChain(20000714),
    Tbinance(30000714),
    Oasis(474),
    Polygon(966),
    Thorchain(931),
    Bluzelle(483),
    Optimism(10000070),
    Zksync(10000324),
    Arbitrum(10042221),
    Ecochain(10000553),
    Avalanchecchain(10009000),
    Xdai(10000100),
    Fantom(10000250),
    CryptoOrg(394),
    Celo(52752),
    Ronin(10002020),
    Osmosis(10000118),
    Ecash(899),
    Iost(291),
    CronosChain(10000025),
    SmartBitcoinCash(10000145),
    KuCoinCommunityChain(10000321),
    BitcoinDiamond(999),
    Boba(10000288),
    Syscoin(57),
    Verge(77),
    Zen(121),
    Metis(10001088),
    Aurora(1323161554),
    Evmos(10009001),
    NativeEvmos(20009001),
    Moonriver(10001285),
    Moonbeam(10001284),
    KavaEvm(10002222),
    Kaia(10008217),
    Meter(18000),
    Okxchain(996),
    Stratis(105105),
    Komodo(141),
    Nervos(309),
    Everscale(396),
    Aptos(637),
    Nebl(146),
    Hedera(3030),
    Secret(529),
    NativeInjective(10000060),
    Agoric(564),
    Ton(607),
    Sui(784),
    Stargaze(20000118),
    Polygonzkevm(10001101),
    Juno(30000118),
    Stride(40000118),
    Axelar(50000118),
    Crescent(60000118),
    Kujira(70000118),
    Iotexevm(10004689),
    NativeCanto(10007700),
    Comdex(80000118),
    Neutron(90000118),
    Sommelier(11000118),
    Fetchai(12000118),
    Mars(13000118),
    Umee(14000118),
    Coreum(10000990),
    Quasar(15000118),
    Persistence(16000118),
    Akash(17000118),
    Noble(18000118),
    Scroll(534352),
    Rootstock(137),
    ThetaFuel(361),
    ConfluxeSpace(1030),
    Acala(787),
    Acalaevm(10000787),
    Opbnb(204),
    Neon(245022934),
    Base(8453),
    Sei(19000118),
    ArbitrumNova(10042170),
    Linea(59144),
    Greenfield(5600),
    Mantle(5000),
    Zeneon(7332),
    InternetComputer(223),
    Tia(21000118),
    MantaPacific(169),
    NativeZetaChain(10007000),
    Zetaevm(20007000),
    Dydx(22000118),
    Merlin(4200),
    Lightlink(1890),
    Blast(81457),
    BounceBit(6001),
    ZkLinkNova(810180),
    Pactus(21888),
    Sonic(10000146),
    Polymesh(595),
    ;

    final int value;
    const CoinType(this.value);

    static CoinType? fromValue(int value) {
        switch (value) {
            case 457:
                return CoinType.Aeternity;
            case 425:
                return CoinType.Aion;
            case 714:
                return CoinType.Binance;
            case 0:
                return CoinType.Bitcoin;
            case 145:
                return CoinType.BitcoinCash;
            case 156:
                return CoinType.BitcoinGold;
            case 820:
                return CoinType.Callisto;
            case 1815:
                return CoinType.Cardano;
            case 118:
                return CoinType.Cosmos;
            case 119:
                return CoinType.Pivx;
            case 5:
                return CoinType.Dash;
            case 42:
                return CoinType.Decred;
            case 20:
                return CoinType.DigiByte;
            case 3:
                return CoinType.Dogecoin;
            case 194:
                return CoinType.Eos;
            case 14001:
                return CoinType.Wax;
            case 60:
                return CoinType.Ethereum;
            case 61:
                return CoinType.EthereumClassic;
            case 235:
                return CoinType.Fio;
            case 6060:
                return CoinType.GoChain;
            case 17:
                return CoinType.Groestlcoin;
            case 74:
                return CoinType.Icon;
            case 304:
                return CoinType.IoTeX;
            case 459:
                return CoinType.Kava;
            case 2017:
                return CoinType.Kin;
            case 2:
                return CoinType.Litecoin;
            case 22:
                return CoinType.Monacoin;
            case 2718:
                return CoinType.Nebulas;
            case 8964:
                return CoinType.Nuls;
            case 165:
                return CoinType.Nano;
            case 397:
                return CoinType.Near;
            case 242:
                return CoinType.Nimiq;
            case 1024:
                return CoinType.Ontology;
            case 178:
                return CoinType.Poanetwork;
            case 2301:
                return CoinType.Qtum;
            case 144:
                return CoinType.Xrp;
            case 501:
                return CoinType.Solana;
            case 148:
                return CoinType.Stellar;
            case 1729:
                return CoinType.Tezos;
            case 500:
                return CoinType.Theta;
            case 1001:
                return CoinType.ThunderCore;
            case 888:
                return CoinType.Neo;
            case 889:
                return CoinType.Viction;
            case 195:
                return CoinType.Tron;
            case 818:
                return CoinType.VeChain;
            case 14:
                return CoinType.Viacoin;
            case 5718350:
                return CoinType.Wanchain;
            case 133:
                return CoinType.Zcash;
            case 136:
                return CoinType.Firo;
            case 313:
                return CoinType.Zilliqa;
            case 19167:
                return CoinType.Zelcash;
            case 175:
                return CoinType.Ravencoin;
            case 5741564:
                return CoinType.Waves;
            case 330:
                return CoinType.Terra;
            case 10000330:
                return CoinType.TerraV2;
            case 1023:
                return CoinType.Harmony;
            case 283:
                return CoinType.Algorand;
            case 434:
                return CoinType.Kusama;
            case 354:
                return CoinType.Polkadot;
            case 461:
                return CoinType.Filecoin;
            case 508:
                return CoinType.MultiversX;
            case 494:
                return CoinType.BandChain;
            case 10000714:
                return CoinType.SmartChainLegacy;
            case 20000714:
                return CoinType.SmartChain;
            case 30000714:
                return CoinType.Tbinance;
            case 474:
                return CoinType.Oasis;
            case 966:
                return CoinType.Polygon;
            case 931:
                return CoinType.Thorchain;
            case 483:
                return CoinType.Bluzelle;
            case 10000070:
                return CoinType.Optimism;
            case 10000324:
                return CoinType.Zksync;
            case 10042221:
                return CoinType.Arbitrum;
            case 10000553:
                return CoinType.Ecochain;
            case 10009000:
                return CoinType.Avalanchecchain;
            case 10000100:
                return CoinType.Xdai;
            case 10000250:
                return CoinType.Fantom;
            case 394:
                return CoinType.CryptoOrg;
            case 52752:
                return CoinType.Celo;
            case 10002020:
                return CoinType.Ronin;
            case 10000118:
                return CoinType.Osmosis;
            case 899:
                return CoinType.Ecash;
            case 291:
                return CoinType.Iost;
            case 10000025:
                return CoinType.CronosChain;
            case 10000145:
                return CoinType.SmartBitcoinCash;
            case 10000321:
                return CoinType.KuCoinCommunityChain;
            case 999:
                return CoinType.BitcoinDiamond;
            case 10000288:
                return CoinType.Boba;
            case 57:
                return CoinType.Syscoin;
            case 77:
                return CoinType.Verge;
            case 121:
                return CoinType.Zen;
            case 10001088:
                return CoinType.Metis;
            case 1323161554:
                return CoinType.Aurora;
            case 10009001:
                return CoinType.Evmos;
            case 20009001:
                return CoinType.NativeEvmos;
            case 10001285:
                return CoinType.Moonriver;
            case 10001284:
                return CoinType.Moonbeam;
            case 10002222:
                return CoinType.KavaEvm;
            case 10008217:
                return CoinType.Kaia;
            case 18000:
                return CoinType.Meter;
            case 996:
                return CoinType.Okxchain;
            case 105105:
                return CoinType.Stratis;
            case 141:
                return CoinType.Komodo;
            case 309:
                return CoinType.Nervos;
            case 396:
                return CoinType.Everscale;
            case 637:
                return CoinType.Aptos;
            case 146:
                return CoinType.Nebl;
            case 3030:
                return CoinType.Hedera;
            case 529:
                return CoinType.Secret;
            case 10000060:
                return CoinType.NativeInjective;
            case 564:
                return CoinType.Agoric;
            case 607:
                return CoinType.Ton;
            case 784:
                return CoinType.Sui;
            case 20000118:
                return CoinType.Stargaze;
            case 10001101:
                return CoinType.Polygonzkevm;
            case 30000118:
                return CoinType.Juno;
            case 40000118:
                return CoinType.Stride;
            case 50000118:
                return CoinType.Axelar;
            case 60000118:
                return CoinType.Crescent;
            case 70000118:
                return CoinType.Kujira;
            case 10004689:
                return CoinType.Iotexevm;
            case 10007700:
                return CoinType.NativeCanto;
            case 80000118:
                return CoinType.Comdex;
            case 90000118:
                return CoinType.Neutron;
            case 11000118:
                return CoinType.Sommelier;
            case 12000118:
                return CoinType.Fetchai;
            case 13000118:
                return CoinType.Mars;
            case 14000118:
                return CoinType.Umee;
            case 10000990:
                return CoinType.Coreum;
            case 15000118:
                return CoinType.Quasar;
            case 16000118:
                return CoinType.Persistence;
            case 17000118:
                return CoinType.Akash;
            case 18000118:
                return CoinType.Noble;
            case 534352:
                return CoinType.Scroll;
            case 137:
                return CoinType.Rootstock;
            case 361:
                return CoinType.ThetaFuel;
            case 1030:
                return CoinType.ConfluxeSpace;
            case 787:
                return CoinType.Acala;
            case 10000787:
                return CoinType.Acalaevm;
            case 204:
                return CoinType.Opbnb;
            case 245022934:
                return CoinType.Neon;
            case 8453:
                return CoinType.Base;
            case 19000118:
                return CoinType.Sei;
            case 10042170:
                return CoinType.ArbitrumNova;
            case 59144:
                return CoinType.Linea;
            case 5600:
                return CoinType.Greenfield;
            case 5000:
                return CoinType.Mantle;
            case 7332:
                return CoinType.Zeneon;
            case 223:
                return CoinType.InternetComputer;
            case 21000118:
                return CoinType.Tia;
            case 169:
                return CoinType.MantaPacific;
            case 10007000:
                return CoinType.NativeZetaChain;
            case 20007000:
                return CoinType.Zetaevm;
            case 22000118:
                return CoinType.Dydx;
            case 4200:
                return CoinType.Merlin;
            case 1890:
                return CoinType.Lightlink;
            case 81457:
                return CoinType.Blast;
            case 6001:
                return CoinType.BounceBit;
            case 810180:
                return CoinType.ZkLinkNova;
            case 21888:
                return CoinType.Pactus;
            case 10000146:
                return CoinType.Sonic;
            case 595:
                return CoinType.Polymesh;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
