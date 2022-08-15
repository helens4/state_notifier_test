
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

class BgColorState extends Equatable {
  final Color color;

  BgColorState({required this.color});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [color];

  BgColorState copyWith({Color? color}) {
    return BgColorState(color: color ?? this.color);
  }
}

class BgColor extends StateNotifier<BgColorState> {
  BgColor() : super(BgColorState(color: Colors.blue));

  void changeColor() {
    if(state.color == Colors.blue) {
      state = state.copyWith(color: Colors.black);
    } else if(state.color == Colors.black) {
      state = state.copyWith(color: Colors.red);
    } else {
      state = state.copyWith(color: Colors.blue);
    }
  }
}




