part of '../generated.dart';
enum HDVersion {
    None(0),
    Xpub(76067358),
    Xprv(76066276),
    Ypub(77429938),
    Yprv(77428856),
    Zpub(78792518),
    Zprv(78791436),
    Vpub(73342198),
    Vprv(73341116),
    Tpub(70617039),
    Tprv(70615956),
    Ltub(27108450),
    Ltpv(27106558),
    Mtub(28471030),
    Mtpv(28469138),
    Ttub(70711009),
    Ttpv(70709117),
    Dpub(50178342),
    Dprv(50177256),
    Dgub(49990397),
    Dgpv(49988504),
    ;

    final int value;
    const HDVersion(this.value);

    static HDVersion? fromValue(int value) {
        switch (value) {
            case 0:
                return HDVersion.None;
            case 76067358:
                return HDVersion.Xpub;
            case 76066276:
                return HDVersion.Xprv;
            case 77429938:
                return HDVersion.Ypub;
            case 77428856:
                return HDVersion.Yprv;
            case 78792518:
                return HDVersion.Zpub;
            case 78791436:
                return HDVersion.Zprv;
            case 73342198:
                return HDVersion.Vpub;
            case 73341116:
                return HDVersion.Vprv;
            case 70617039:
                return HDVersion.Tpub;
            case 70615956:
                return HDVersion.Tprv;
            case 27108450:
                return HDVersion.Ltub;
            case 27106558:
                return HDVersion.Ltpv;
            case 28471030:
                return HDVersion.Mtub;
            case 28469138:
                return HDVersion.Mtpv;
            case 70711009:
                return HDVersion.Ttub;
            case 70709117:
                return HDVersion.Ttpv;
            case 50178342:
                return HDVersion.Dpub;
            case 50177256:
                return HDVersion.Dprv;
            case 49990397:
                return HDVersion.Dgub;
            case 49988504:
                return HDVersion.Dgpv;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
