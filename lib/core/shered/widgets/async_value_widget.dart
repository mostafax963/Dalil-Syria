import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_error_widget.dart';
import 'app_loader.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? onRetry;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => const AppLoader(),

      error: (e, _) => AppErrorWidget(message: e.toString(), onRetry: onRetry),

      data: data,
    );
  }
}
