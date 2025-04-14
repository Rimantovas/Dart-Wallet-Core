import 'dart:developer';

class DeferManager {
  final List<void Function()> _actions = [];

  void defer(void Function() action) {
    _actions.add(action);
  }

  void runDeferredActions() {
    for (var action in _actions.reversed) {
      try {
        action();
      } catch (e) {
        log('Error running deferred action: $e');
      }
    }
  }
}
