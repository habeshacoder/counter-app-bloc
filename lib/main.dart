import 'package:blocstatemanagment/Bloc/counter_bloc.dart';
import 'package:blocstatemanagment/cubit/counter_cubit.dart';
import 'package:blocstatemanagment/inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounerCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'My Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(
          children: [
            Center(
              child: BlocBuilder<CounterBloc, int>(
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IncDec(),
                    ));
              },
              child: Icon(Icons.minimize),
            )
          ],
        ));
  }
}
