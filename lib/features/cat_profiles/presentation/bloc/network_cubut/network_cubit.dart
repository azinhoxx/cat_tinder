import 'dart:async';
import 'package:cat_tinder/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'network_state.dart';

@injectable
class NetworkCubit extends Cubit<NetworkState> {
  final ConnectivityCheckerHelper _connectivityChecker;
  StreamSubscription<dynamic>? _subscription;

  NetworkCubit(this._connectivityChecker)
    : super(const NetworkState.initial()) {
    _init();
  }

  Future<void> _init() async {
    _subscription = _connectivityChecker.listenToConnectivityChanged().listen((
      results,
    ) {
      final isNowConnected = _connectivityChecker.handleResult(results);
      final NetworkState newState =
          !isNowConnected
              ? const NetworkState.disconnected()
              : state == const NetworkState.disconnected()
              ? const NetworkState.connected()
              : const NetworkState.initial();
      emit(newState);
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
