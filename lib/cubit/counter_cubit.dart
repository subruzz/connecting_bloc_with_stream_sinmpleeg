import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connectivity_bloc/cubit/network_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterIncrement> {
  final network = NetworkCubit();
  CounterCubit() : super(CounterIncrement(0)) {
    listenNetworkCubit();
  }

  void listenNetworkCubit() {
       network.stream.listen((event) {
      if (event is NetworkConnected &&
          event.connectionType == ConnectionType.wifi) {
        emit(CounterIncrement(state.value + 10));
      }
      if (event is NetworkConnected &&
          event.connectionType == ConnectionType.internet) {
        emit(CounterIncrement(state.value - 10));
      }
    });
  }
  void increment() {
    emit(CounterIncrement(state.value + 1));
  }

  void decrement() {
    emit(CounterIncrement(state.value - 1));
  }
}
