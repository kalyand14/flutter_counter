import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/features/counter/ui/counterScreen.dart';
import 'package:helloworld/features/splash/splashScreen.dart';

import 'features/splash/bloc/container_bloc.dart';
import 'features/splash/bloc/container_state.dart';
import 'features/splash/containerManager.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(Application());
}

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider<ContainerBloc>(
        builder: (context) => ContainerBloc(container: ContainerManger()),
        child: BlocBuilder<ContainerBloc, ContainerBlocState>(
          builder: (context, state) {
            if (state is ContainerInitialised) {
              return CounterScreen();
            } else {
              return SplashScreen();
            }
          },
        ),
      ),
    );
  }
}
