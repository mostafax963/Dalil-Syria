import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const AppErrorWidget({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center),

          if (onRetry != null) ...[
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: onRetry,
              child: Text("error_try_again".tr()),
            ),
          ],
        ],
      ),
    );
  }
}
