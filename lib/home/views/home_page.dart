import 'package:flutter/material.dart';
import 'package:flutter_application_4/home/cubit/counter_cubit.dart';
import 'package:flutter_application_4/home/cubit/counter_state.dart';
import 'package:flutter_application_4/home/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  late bool isDark;
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    if (state is Counter) {
                      return Center(
                        child: Text(
                          '${state.count}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      );
                    }
                    return Text('0',
                        style: Theme.of(context).textTheme.headline4);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().increment();
                        },
                        child: const Text('+')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().decrement();
                        },
                        child: const Text('-')),
                  ],
                ),
                BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                  List<Text> his_elele = [];
                  if (state is Counter) {
                    for (var histories in state.history) {
                      his_elele.add(Text(histories));
                    }
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: his_elele,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Тема'),
        onPressed: () {
          context.read<CounterCubit>().toggleTheme();
          context.read<ThemeCubbit>().toggleTheme();
        },
      ),
    );
  }
}
