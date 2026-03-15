import 'package:flutter/widgets.dart';

import 'app_state.dart';

class HastiqScope extends InheritedNotifier<HastiqState> {
  const HastiqScope({
    super.key,
    required HastiqState state,
    required super.child,
  }) : super(notifier: state);

  static HastiqState of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<HastiqScope>();
    assert(scope != null, 'HastiqScope is missing in widget tree');
    return scope!.notifier!;
  }
}
