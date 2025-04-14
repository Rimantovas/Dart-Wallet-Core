part of '../generated.dart';
enum Blockchain {
    Bitcoin(0),
    Ethereum(1),
    Vechain(3),
    Tron(4),
    Icon(5),
    Binance(6),
    Ripple(7),
    Tezos(8),
    Nimiq(9),
    Stellar(10),
    Aion(11),
    Cosmos(12),
    Theta(13),
    Ontology(14),
    Zilliqa(15),
    IoTeX(16),
    Eos(17),
    Nano(18),
    Nuls(19),
    Waves(20),
    Aeternity(21),
    Nebulas(22),
    Fio(23),
    Solana(24),
    Harmony(25),
    Near(26),
    Algorand(27),
    Polkadot(29),
    Cardano(30),
    Neo(31),
    Filecoin(32),
    MultiversX(33),
    OasisNetwork(34),
    Decred(35),
    Zcash(36),
    Groestlcoin(37),
    Thorchain(38),
    Ronin(39),
    Kusama(40),
    Nervos(41),
    Everscale(42),
    Aptos(43),
    Hedera(44),
    TheOpenNetwork(45),
    Sui(46),
    ;

    final int value;
    const Blockchain(this.value);

    static Blockchain? fromValue(int value) {
        switch (value) {
            case 0:
                return Blockchain.Bitcoin;
            case 1:
                return Blockchain.Ethereum;
            case 3:
                return Blockchain.Vechain;
            case 4:
                return Blockchain.Tron;
            case 5:
                return Blockchain.Icon;
            case 6:
                return Blockchain.Binance;
            case 7:
                return Blockchain.Ripple;
            case 8:
                return Blockchain.Tezos;
            case 9:
                return Blockchain.Nimiq;
            case 10:
                return Blockchain.Stellar;
            case 11:
                return Blockchain.Aion;
            case 12:
                return Blockchain.Cosmos;
            case 13:
                return Blockchain.Theta;
            case 14:
                return Blockchain.Ontology;
            case 15:
                return Blockchain.Zilliqa;
            case 16:
                return Blockchain.IoTeX;
            case 17:
                return Blockchain.Eos;
            case 18:
                return Blockchain.Nano;
            case 19:
                return Blockchain.Nuls;
            case 20:
                return Blockchain.Waves;
            case 21:
                return Blockchain.Aeternity;
            case 22:
                return Blockchain.Nebulas;
            case 23:
                return Blockchain.Fio;
            case 24:
                return Blockchain.Solana;
            case 25:
                return Blockchain.Harmony;
            case 26:
                return Blockchain.Near;
            case 27:
                return Blockchain.Algorand;
            case 29:
                return Blockchain.Polkadot;
            case 30:
                return Blockchain.Cardano;
            case 31:
                return Blockchain.Neo;
            case 32:
                return Blockchain.Filecoin;
            case 33:
                return Blockchain.MultiversX;
            case 34:
                return Blockchain.OasisNetwork;
            case 35:
                return Blockchain.Decred;
            case 36:
                return Blockchain.Zcash;
            case 37:
                return Blockchain.Groestlcoin;
            case 38:
                return Blockchain.Thorchain;
            case 39:
                return Blockchain.Ronin;
            case 40:
                return Blockchain.Kusama;
            case 41:
                return Blockchain.Nervos;
            case 42:
                return Blockchain.Everscale;
            case 43:
                return Blockchain.Aptos;
            case 44:
                return Blockchain.Hedera;
            case 45:
                return Blockchain.TheOpenNetwork;
            case 46:
                return Blockchain.Sui;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
