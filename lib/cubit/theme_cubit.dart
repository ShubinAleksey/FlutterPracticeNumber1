import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubbit extends Cubit<ThemeMode> {
  ThemeCubbit() : super(ThemeMode.light);

  bool themeMode = true;

  void toggleTheme() {
    themeMode = !themeMode;
    emit(themeMode ? ThemeMode.light : ThemeMode.dark);
  }
}