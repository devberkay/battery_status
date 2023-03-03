import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationProvider =
    NotifierProvider.autoDispose<NotificationNotifier, bool>(NotificationNotifier.new);

class NotificationNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    // isar code
    return false;
  }

  void toggle() {
    state = !state;
  }
}
