part of '../generated.dart';
enum HRP {
    Unknown(0),
    Bitcoin(1),
    Litecoin(2),
    Viacoin(3),
    Groestlcoin(4),
    DigiByte(5),
    Monacoin(6),
    Syscoin(7),
    Verge(8),
    Cosmos(9),
    BitcoinCash(10),
    BitcoinGold(11),
    IoTeX(12),
    Nervos(13),
    Zilliqa(14),
    Terra(15),
    CryptoOrg(16),
    Kava(17),
    Oasis(18),
    Bluzelle(19),
    BandChain(20),
    MultiversX(21),
    Secret(22),
    Agoric(23),
    Binance(24),
    Ecash(25),
    Thorchain(26),
    BitcoinDiamond(27),
    Harmony(28),
    Cardano(29),
    Qtum(30),
    Pactus(31),
    Stratis(32),
    NativeInjective(33),
    Osmosis(34),
    TerraV2(35),
    Coreum(36),
    NativeZetaChain(37),
    NativeCanto(38),
    Sommelier(39),
    Fetchai(40),
    Mars(41),
    Umee(42),
    Quasar(43),
    Persistence(44),
    Akash(45),
    Noble(46),
    Sei(47),
    Stargaze(48),
    NativeEvmos(49),
    Tia(50),
    Dydx(51),
    Juno(52),
    Tbinance(53),
    Stride(54),
    Axelar(55),
    Crescent(56),
    Kujira(57),
    Comdex(58),
    Neutron(59),
    ;

    final int value;
    const HRP(this.value);

    static HRP? fromValue(int value) {
        switch (value) {
            case 0:
                return HRP.Unknown;
            case 1:
                return HRP.Bitcoin;
            case 2:
                return HRP.Litecoin;
            case 3:
                return HRP.Viacoin;
            case 4:
                return HRP.Groestlcoin;
            case 5:
                return HRP.DigiByte;
            case 6:
                return HRP.Monacoin;
            case 7:
                return HRP.Syscoin;
            case 8:
                return HRP.Verge;
            case 9:
                return HRP.Cosmos;
            case 10:
                return HRP.BitcoinCash;
            case 11:
                return HRP.BitcoinGold;
            case 12:
                return HRP.IoTeX;
            case 13:
                return HRP.Nervos;
            case 14:
                return HRP.Zilliqa;
            case 15:
                return HRP.Terra;
            case 16:
                return HRP.CryptoOrg;
            case 17:
                return HRP.Kava;
            case 18:
                return HRP.Oasis;
            case 19:
                return HRP.Bluzelle;
            case 20:
                return HRP.BandChain;
            case 21:
                return HRP.MultiversX;
            case 22:
                return HRP.Secret;
            case 23:
                return HRP.Agoric;
            case 24:
                return HRP.Binance;
            case 25:
                return HRP.Ecash;
            case 26:
                return HRP.Thorchain;
            case 27:
                return HRP.BitcoinDiamond;
            case 28:
                return HRP.Harmony;
            case 29:
                return HRP.Cardano;
            case 30:
                return HRP.Qtum;
            case 31:
                return HRP.Pactus;
            case 32:
                return HRP.Stratis;
            case 33:
                return HRP.NativeInjective;
            case 34:
                return HRP.Osmosis;
            case 35:
                return HRP.TerraV2;
            case 36:
                return HRP.Coreum;
            case 37:
                return HRP.NativeZetaChain;
            case 38:
                return HRP.NativeCanto;
            case 39:
                return HRP.Sommelier;
            case 40:
                return HRP.Fetchai;
            case 41:
                return HRP.Mars;
            case 42:
                return HRP.Umee;
            case 43:
                return HRP.Quasar;
            case 44:
                return HRP.Persistence;
            case 45:
                return HRP.Akash;
            case 46:
                return HRP.Noble;
            case 47:
                return HRP.Sei;
            case 48:
                return HRP.Stargaze;
            case 49:
                return HRP.NativeEvmos;
            case 50:
                return HRP.Tia;
            case 51:
                return HRP.Dydx;
            case 52:
                return HRP.Juno;
            case 53:
                return HRP.Tbinance;
            case 54:
                return HRP.Stride;
            case 55:
                return HRP.Axelar;
            case 56:
                return HRP.Crescent;
            case 57:
                return HRP.Kujira;
            case 58:
                return HRP.Comdex;
            case 59:
                return HRP.Neutron;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
