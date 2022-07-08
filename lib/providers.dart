import 'package:arna/arna.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<Brightness?> themeProvider =
    StateProvider.autoDispose<Brightness?>(
  (AutoDisposeStateProviderRef<Brightness?> ref) => null,
);

final AutoDisposeStateProvider<bool> blurProvider =
    StateProvider.autoDispose<bool>(
  (AutoDisposeStateProviderRef<bool> ref) => !kIsWeb,
);

final AutoDisposeStateProvider<String> sourceProvider =
    StateProvider.autoDispose<String>(
  (AutoDisposeStateProviderRef<String> ref) => 'auto',
);

final AutoDisposeStateProvider<String> targetProvider =
    StateProvider.autoDispose<String>(
  (AutoDisposeStateProviderRef<String> ref) => 'en',
);

final AutoDisposeStateProvider<String?> outputProvider =
    StateProvider.autoDispose<String?>(
  (AutoDisposeStateProviderRef<String?> ref) => '',
);

final AutoDisposeStateProvider<bool> autoProvider =
    StateProvider.autoDispose<bool>(
  (AutoDisposeStateProviderRef<bool> ref) => false,
);
