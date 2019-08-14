import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/features/counter/ui/counterScreen.dart';
import 'package:helloworld/features/splash/bloc/splashbloc_bloc.dart';
import 'package:helloworld/features/splash/bloc/splashbloc_state.dart';
import 'package:helloworld/features/splash/container.dart';
import 'package:helloworld/features/splash/splashScreen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<SplashblocBloc>(
        builder: (context) => SplashblocBloc(container: ContainerManger()),
        child: BlocBuilder<SplashblocBloc, SplashblocState>(
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
