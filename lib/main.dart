import 'package:dalil_syria/core/config/supabase_config.dart';
import 'package:dalil_syria/core/providers/app_providers.dart';
import 'package:dalil_syria/core/providers/notification_service_provider.dart';
import 'package:dalil_syria/core/services/notification_service.dart';
import 'package:dalil_syria/core/theme/app_theme.dart';
import 'package:dalil_syria/core/providers/theme_provider.dart';

import 'package:dalil_syria/features/splash/presentation/views/splash_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  await Supabase.initialize(
    url: SupabaseConfig.supabaseUrl,
    anonKey: SupabaseConfig.supabaseAnonKey,
  );
  final notificationService = NotificationService();
  await notificationService.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: ProviderScope(
        overrides: [
          sharedPrefsProvider.overrideWithValue(prefs),
          notificationServiceProvider.overrideWithValue(notificationService),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale;
    final themeModee = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      key: ValueKey(locale),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeModee,
      home: SplashView(),
    );
  }
}
