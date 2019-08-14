import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ContainerBlocEvent extends Equatable {
  ContainerBlocEvent([List props = const <dynamic>[]]) : super(props);
}

class InitialiseContainer extends ContainerBlocEvent {}
