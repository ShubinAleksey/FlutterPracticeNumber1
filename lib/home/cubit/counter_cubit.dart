import 'package:flutter/material.dart';
import 'package:flutter_application_4/home/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int count = 0;
  ThemeMode themeData = ThemeMode.light;
  List<String> history = [];

  void increment() {
    if (themeData == ThemeMode.light) {
      count += 1;
      themeData = ThemeMode.light;
      history.add('Инкрементирование по светлой - ${DateTime.now()}');
      emit(Counter(count: count, history: history));
    } else {
      count += 2;
      themeData = ThemeMode.dark;
      history.add('Инкрементирование по темной - ${DateTime.now()}');
      emit(Counter(count: count, history: history));
    }
  }

  void decrement() {
    if (themeData == ThemeMode.light) {
      count -= 1;
      themeData = ThemeMode.light;
      history.add('Дикрементирование по светлой - ${DateTime.now()}');
      emit(Counter(count: count, history: history));
    } else {
      count -= 2;
      themeData = ThemeMode.dark;
      history.add('Дикрементирование по темной - ${DateTime.now()}');
      emit(Counter(count: count, history: history));
    }
  }

  void toggleTheme() {
    if (themeData == ThemeMode.light) {
      themeData = ThemeMode.dark;
      history.add('Тема черная - ${DateTime.now()}');
      emit(Counter(count: count, history: history));
    } else {
      themeData = ThemeMode.light;
      history.add('Тема светлая - ${DateTime.now()}');
      emit(Counter(count: count, history: history));
    }
  }
}
