import 'package:bloc_counter_with_hive/features/counter/data/counter_storedata.dart';
import 'package:bloc_counter_with_hive/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_counter_with_hive/features/counter/presentation/screen/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await CounterStoreData.initHive();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
      ),
    );
  }
}
