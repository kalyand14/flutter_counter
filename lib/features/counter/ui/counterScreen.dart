import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/features/counter/bloc/bloc.dart';
import 'package:helloworld/features/counter/ui/counterWidget.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        builder: (BuildContext context) => CounterBloc(),
        child: BlocListener<CounterBloc, int>(
            listener: (BuildContext context, int count) {},
            child: BlocBuilder<CounterBloc, int>(
                builder: (BuildContext context, int count) {
              return CounterWidget(count: count);
            })));
  }
}
