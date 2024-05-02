part of 'counter_cubit.dart';

sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterIncrement extends CounterState {
  final int value;

  CounterIncrement(this.value);

}
