import 'package:blocstatemanagment/Bloc/counter_bloc.dart';
import 'package:blocstatemanagment/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDec extends StatelessWidget {
  const IncDec({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
        body: Column(
      children: [
        InkWell(
          onTap: () {
            counterBloc.add(CounterIncremented());
          },
          child: Icon(Icons.add),
        ),
        InkWell(
          onTap: () {
            counterBloc.add(CounterDecremented());
          },
          child: Icon(Icons.minimize),
        )
      ],
    ));
  }
}
