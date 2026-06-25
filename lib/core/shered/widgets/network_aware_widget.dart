import 'package:dalil_syria/core/providers/connection_provider.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkAwareWidget extends ConsumerWidget {
  final Widget child;
  final VoidCallback onRetry;

  const NetworkAwareWidget({
    super.key,
    required this.child,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivity = ref.watch(internetStatusProvider);

    return connectivity.when(
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },

      error: (_, __) {
        return Scaffold(body: Center(child: Text("error_generic".tr())));
      },

      data: (isConnected) {
        if (!isConnected) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off, size: 80, color: Colors.grey),

                  const SizedBox(height: 20),

                  Text(
                    "coniction_state".tr(),
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: onRetry,
                    child: Text("error_try_again".tr()),
                  ),
                ],
              ),
            ),
          );
        }

        return child;
      },
    );
  }
}
