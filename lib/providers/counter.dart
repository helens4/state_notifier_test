import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/material.dart';

import 'bg_color.dart';

class CounterState extends Equatable {
  final int counter;

  CounterState({required this.counter});

  @override
  List<Object?> get props => [counter];

  @override
  bool get stringify => true;

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

}

class Counter extends StateNotifier<CounterState> with LocatorMixin {
  Counter() : super(CounterState(counter: 0));

  void increment() {
    Color currentColor = read<BgColor>().state.color;

    if(currentColor == Colors.black) {
      state = state.copyWith(counter: state.counter + 10);
    } else if(currentColor == Colors.red) {
      state = state.copyWith(counter: state.counter - 10);
    } else {
      state = state.copyWith(counter: state.counter + 1);
    }
  }

  @override
  void update(Locator watch) {
    print('state: ${watch<BgColorState>().color}');
    super.update(watch);
  }
}