part of '../generated.dart';
enum HRP {
    Unknown(0),
    Bitcoin(1),
    Litecoin(2),
    Viacoin(3),
    Groestlcoin(4),
    DigiByte(5),
    Monacoin(6),
    Cosmos(7),
    BitcoinCash(8),
    BitcoinGold(9),
    IoTeX(10),
    Nervos(11),
    Zilliqa(12),
    Terra(13),
    CryptoOrg(14),
    Kava(15),
    Oasis(16),
    Bluzelle(17),
    BandChain(18),
    MultiversX(19),
    Secret(20),
    Agoric(21),
    Binance(22),
    Ecash(23),
    Thorchain(24),
    Harmony(25),
    Cardano(26),
    Qtum(27),
    NativeInjective(28),
    Osmosis(29),
    TerraV2(30),
    Coreum(31),
    NativeCanto(32),
    Sommelier(33),
    FetchAI(34),
    Mars(35),
    Umee(36),
    Quasar(37),
    Persistence(38),
    Akash(39),
    Noble(40),
    Stargaze(41),
    NativeEvmos(42),
    Juno(43),
    Stride(44),
    Axelar(45),
    Crescent(46),
    Kujira(47),
    Comdex(48),
    Neutron(49),
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
                return HRP.Cosmos;
            case 8:
                return HRP.BitcoinCash;
            case 9:
                return HRP.BitcoinGold;
            case 10:
                return HRP.IoTeX;
            case 11:
                return HRP.Nervos;
            case 12:
                return HRP.Zilliqa;
            case 13:
                return HRP.Terra;
            case 14:
                return HRP.CryptoOrg;
            case 15:
                return HRP.Kava;
            case 16:
                return HRP.Oasis;
            case 17:
                return HRP.Bluzelle;
            case 18:
                return HRP.BandChain;
            case 19:
                return HRP.MultiversX;
            case 20:
                return HRP.Secret;
            case 21:
                return HRP.Agoric;
            case 22:
                return HRP.Binance;
            case 23:
                return HRP.Ecash;
            case 24:
                return HRP.Thorchain;
            case 25:
                return HRP.Harmony;
            case 26:
                return HRP.Cardano;
            case 27:
                return HRP.Qtum;
            case 28:
                return HRP.NativeInjective;
            case 29:
                return HRP.Osmosis;
            case 30:
                return HRP.TerraV2;
            case 31:
                return HRP.Coreum;
            case 32:
                return HRP.NativeCanto;
            case 33:
                return HRP.Sommelier;
            case 34:
                return HRP.FetchAI;
            case 35:
                return HRP.Mars;
            case 36:
                return HRP.Umee;
            case 37:
                return HRP.Quasar;
            case 38:
                return HRP.Persistence;
            case 39:
                return HRP.Akash;
            case 40:
                return HRP.Noble;
            case 41:
                return HRP.Stargaze;
            case 42:
                return HRP.NativeEvmos;
            case 43:
                return HRP.Juno;
            case 44:
                return HRP.Stride;
            case 45:
                return HRP.Axelar;
            case 46:
                return HRP.Crescent;
            case 47:
                return HRP.Kujira;
            case 48:
                return HRP.Comdex;
            case 49:
                return HRP.Neutron;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

    @override
    String toString() {
        switch (this) {
            case Unknown:
                return "";
            case Bitcoin:
                return "bc";
            case Litecoin:
                return "ltc";
            case Viacoin:
                return "via";
            case Groestlcoin:
                return "grs";
            case DigiByte:
                return "dgb";
            case Monacoin:
                return "mona";
            case Cosmos:
                return "cosmos";
            case BitcoinCash:
                return "bitcoincash";
            case BitcoinGold:
                return "btg";
            case IoTeX:
                return "io";
            case Nervos:
                return "ckb";
            case Zilliqa:
                return "zil";
            case Terra:
                return "terra";
            case CryptoOrg:
                return "cro";
            case Kava:
                return "kava";
            case Oasis:
                return "oasis";
            case Bluzelle:
                return "bluzelle";
            case BandChain:
                return "band";
            case MultiversX:
                return "erd";
            case Secret:
                return "secret";
            case Agoric:
                return "agoric";
            case Binance:
                return "bnb";
            case Ecash:
                return "ecash";
            case Thorchain:
                return "thor";
            case Harmony:
                return "one";
            case Cardano:
                return "addr";
            case Qtum:
                return "qc";
            case NativeInjective:
                return "inj";
            case Osmosis:
                return "osmo";
            case TerraV2:
                return "terra";
            case Coreum:
                return "core";
            case NativeCanto:
                return "canto";
            case Sommelier:
                return "somm";
            case FetchAI:
                return "fetch";
            case Mars:
                return "mars";
            case Umee:
                return "umee";
            case Quasar:
                return "quasar";
            case Persistence:
                return "persistence";
            case Akash:
                return "akash";
            case Noble:
                return "noble";
            case Stargaze:
                return "stars";
            case NativeEvmos:
                return "evmos";
            case Juno:
                return "juno";
            case Stride:
                return "stride";
            case Axelar:
                return "axelar";
            case Crescent:
                return "cre";
            case Kujira:
                return "kujira";
            case Comdex:
                return "comdex";
            case Neutron:
                return "neutron";
        }
    }
}
