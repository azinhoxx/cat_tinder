import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityCheckerHelper {
  Future<bool> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    return handleResult(connectivityResult);
  }

  Stream<List<ConnectivityResult>> listenToConnectivityChanged() {
    return Connectivity().onConnectivityChanged;
  }

  bool handleResult(List<ConnectivityResult> connectivityResult) {
    final bool connected;

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      connected = true;
    } else {
      connected = false;
    }

    return connected;
  }
}
