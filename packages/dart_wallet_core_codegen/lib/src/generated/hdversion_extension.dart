part of 'generated.dart';
extension HDVersionExtension on HDVersion {

bool get isPublic {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWHDVersionIsPublic(rawValue);
    deferManager.runDeferredActions();
    return result;
}


bool get isPrivate {
    final deferManager = DeferManager();
    var result = WalletCore.wcb.TWHDVersionIsPrivate(rawValue);
    deferManager.runDeferredActions();
    return result;
}
}
