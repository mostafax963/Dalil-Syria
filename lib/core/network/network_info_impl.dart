import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dalil_syria/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  final InternetConnectionChecker internetChecker;

  NetworkInfoImpl(this.connectivity, this.internetChecker);

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    return await internetChecker.hasConnection;
  }
}
