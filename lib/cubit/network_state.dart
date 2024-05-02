part of 'network_cubit.dart';

enum ConnectionType { wifi, internet }

sealed class NetworkState {}

final class NetworkInitial extends NetworkState {}

final class NetworkConnected extends NetworkState {
  final ConnectionType connectionType;

  NetworkConnected(this.connectionType);
}

final class NetworkDisconnected extends NetworkState {}
