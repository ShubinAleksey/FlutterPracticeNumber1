import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/home/cubit/counter_cubit.dart';
import 'package:flutter_application_4/home/cubit/theme_cubit.dart';
import 'package:flutter_application_4/home/views/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/cubit/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ThemeCubbit()),
      ],
      child: BlocBuilder<ThemeCubbit, ThemeMode> (
        builder: (context, state) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: state,
          home: HomePage(),
        );
      }),
    );
  }
}
