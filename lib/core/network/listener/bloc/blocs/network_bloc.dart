import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../event/network_event.dart';
import '../state/network_states.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  NetworkBloc({required Connectivity connectivity})
    : _connectivity = connectivity,
      super(NetworkInitial()) {
    // Listen for connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      connectivityResult,
    ) {
      add(CheckNetworkStatus()); // Dispatch event when connectivity changes
    });

    // Handle the event to check the network status
    on<CheckNetworkStatus>((event, emit) async {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.first.name == "none") {
        emit(NetworkDisconnected());
      } else {
        emit(NetworkConnected());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
