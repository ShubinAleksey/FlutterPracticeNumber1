import 'package:flutter/material.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ChangeThemeState extends ThemeState {
  ThemeData themeData;

  ChangeThemeState({required this.themeData});
}