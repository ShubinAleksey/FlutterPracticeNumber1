import 'package:flutter/material.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class Counter extends CounterState {
  final int count;
  final List<String> history;

  Counter(
      {required this.count, required this.history});
}
