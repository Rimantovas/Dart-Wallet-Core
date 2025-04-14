part of '../generated.dart';
enum HDVersion {
    None(0),
    Xpub(0x0488b21e),
    Xprv(0x0488ade4),
    Ypub(0x049d7cb2),
    Yprv(0x049d7878),
    Zpub(0x04b24746),
    Zprv(0x04b2430c),
    Ltub(0x019da462),
    Ltpv(0x019d9cfe),
    Mtub(0x01b26ef6),
    Mtpv(0x01b26792),
    Dpub(0x2fda926),
    Dprv(0x2fda4e8),
    Dgub(0x02facafd),
    Dgpv(0x02fac398),
    ;

    final int value;
    const HDVersion(this.value);

    static HDVersion? fromValue(int value) {
        switch (value) {
            case 0:
                return HDVersion.None;
            case 0x0488b21e:
                return HDVersion.Xpub;
            case 0x0488ade4:
                return HDVersion.Xprv;
            case 0x049d7cb2:
                return HDVersion.Ypub;
            case 0x049d7878:
                return HDVersion.Yprv;
            case 0x04b24746:
                return HDVersion.Zpub;
            case 0x04b2430c:
                return HDVersion.Zprv;
            case 0x019da462:
                return HDVersion.Ltub;
            case 0x019d9cfe:
                return HDVersion.Ltpv;
            case 0x01b26ef6:
                return HDVersion.Mtub;
            case 0x01b26792:
                return HDVersion.Mtpv;
            case 0x2fda926:
                return HDVersion.Dpub;
            case 0x2fda4e8:
                return HDVersion.Dprv;
            case 0x02facafd:
                return HDVersion.Dgub;
            case 0x02fac398:
                return HDVersion.Dgpv;
            default:
                return null;
        }
    }

    int get rawValue {
        return value;
    }

}
