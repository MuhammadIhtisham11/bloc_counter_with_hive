import 'dart:async';

import 'package:bloc_counter_with_hive/features/counter/data/counter_storedata.dart';
import 'package:bloc_counter_with_hive/features/counter/presentation/bloc/counter_event.dart';
import 'package:bloc_counter_with_hive/features/counter/presentation/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: CounterStoreData.getData())) {
    on<Increment>(_increment);
    on<Decrement>(_decrement);
    on<Reset>(_reset);
  }

  FutureOr<void> _increment(Increment event, Emitter<CounterState> emit) async {
    final newvalue = state.counter + 1;
    await CounterStoreData.saveData(newvalue);
    emit(CounterState(counter: newvalue));
  }

  FutureOr<void> _decrement(Decrement event, Emitter<CounterState> emit) async {
    final newvalue = state.counter - 1;
    await CounterStoreData.saveData(newvalue);
    emit(CounterState(counter: newvalue));
  }

  FutureOr<void> _reset(Reset event, Emitter<CounterState> emit) async {
    final newvalue = state.counter = 1;
    await CounterStoreData.saveData(newvalue);
    emit(CounterState(counter: newvalue));
  }
}
