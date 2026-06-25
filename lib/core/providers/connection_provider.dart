import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dalil_syria/core/network/network_info.dart';
import 'package:dalil_syria/core/network/network_info_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final connectivityProvider = Provider((ref) {
  return Connectivity();
});

final internetCheckerProvider = Provider((ref) {
  return InternetConnectionChecker();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(
    ref.read(connectivityProvider),
    ref.read(internetCheckerProvider),
  );
});

final internetStatusProvider = StreamProvider<bool>((ref) async* {
  final checker = InternetConnectionChecker();

  yield await checker.hasConnection;

  await for (final status in checker.onStatusChange) {
    yield status == InternetConnectionStatus.connected;
  }
});
