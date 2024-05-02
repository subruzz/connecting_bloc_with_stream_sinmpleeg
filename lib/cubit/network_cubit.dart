import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> subscription;
  NetworkCubit() : super(NetworkInitial()) {
    networkSubsciption();
  }

  void networkSubsciption() {
     subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.wifi)) {
        emit(NetworkConnected(ConnectionType.wifi));
      } else if (result.contains(ConnectivityResult.mobile)) {
        emit(NetworkConnected(ConnectionType.internet));
      } else if (result.contains(ConnectivityResult.none)) {
        emit(NetworkDisconnected());
      }
    });
  }
  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
