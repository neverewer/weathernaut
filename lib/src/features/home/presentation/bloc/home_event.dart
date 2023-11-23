// sealed class HomeEvent {
//   const HomeEvent();
// }

// final class

import 'package:meta/meta.dart';

sealed class HomeEvent extends _$HomeEventBase {
  const factory HomeEvent.fetch() = HomeEvent$Fetch;

  const HomeEvent();
}

final class HomeEvent$Fetch extends HomeEvent {
  const HomeEvent$Fetch();
}

/// Pattern matching for [HomeState].
typedef HomeEventMatch<R, S extends HomeEvent> = R Function(S state);

@immutable
abstract base class _$HomeEventBase {
  const _$HomeEventBase();

  R map<R>({
    required HomeEventMatch<R, HomeEvent$Fetch> fetch,
  }) =>
      switch (this) {
        HomeEvent$Fetch s => fetch(s),
        _ => throw AssertionError(),
      };
}
