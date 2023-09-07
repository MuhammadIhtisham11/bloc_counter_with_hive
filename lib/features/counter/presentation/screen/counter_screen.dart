import 'package:bloc_counter_with_hive/common/appcolors.dart';
import 'package:bloc_counter_with_hive/common/apptextStyle.dart';
import 'package:bloc_counter_with_hive/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_counter_with_hive/features/counter/presentation/bloc/counter_event.dart';
import 'package:bloc_counter_with_hive/features/counter/presentation/bloc/counter_state.dart';
import 'package:bloc_counter_with_hive/features/counter/presentation/widget/customappbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color valuecolor = Colors.black;
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.background,
          appBar: CAppBar(text: "Counter App"),
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " ${state.counter}",
                    style: AppText.countervalue.copyWith(color: valuecolor),
                  ),
                  Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(Decrement());
                          valuecolor = AppColor.decrementcolor;
                        },
                        child: Icon(Icons.minimize),
                        backgroundColor: AppColor.decrementcolor,
                      ),
                      Gap(10),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context).add(Reset());
                          valuecolor = Colors.black;
                        },
                        child: Icon(Icons.restart_alt, color: Colors.black),
                        backgroundColor: AppColor.resetcolor,
                      ),
                      Gap(10),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(Increment());
                          valuecolor = AppColor.incrementcolor;
                        },
                        child: Icon(Icons.add),
                        backgroundColor: AppColor.incrementcolor,
                      ),
                      Gap(10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
