import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../containerManager.dart';
import './bloc.dart';

class ContainerBloc extends Bloc<ContainerBlocEvent, ContainerBlocState> {
  final ContainerManger container;

  ContainerBloc({@required this.container}) : assert(container != null);

  @override
  ContainerBlocState get initialState => ContainerUnInitialised();

  @override
  Stream<ContainerBlocState> mapEventToState(
    ContainerBlocEvent event,
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
