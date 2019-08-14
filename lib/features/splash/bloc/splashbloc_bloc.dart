import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:helloworld/features/splash/container.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class SplashblocBloc extends Bloc<SplashblocEvent, SplashblocState> {
  final ContainerManger container;

  SplashblocBloc({@required this.container}) : assert(container != null);

  @override
  SplashblocState get initialState => ContainerUnInitialised();

  @override
  Stream<SplashblocState> mapEventToState(
    SplashblocEvent event,
  ) async* {
    if (event is InitialiseContainer) {
      yield InitialingContainer();
      try {
        final String token = await container.initialise(environment: "SIT1");
        yield ContainerInitialised(token);
      } on Exception {
        yield ContainerNotInitialised();
      }
    }
  }
}
