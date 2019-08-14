import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ContainerBlocState extends Equatable {
  ContainerBlocState([List props = const <dynamic>[]]) : super(props);
}

class ContainerUnInitialised extends ContainerBlocState {}

class InitialingContainer extends ContainerBlocState {}

class ContainerInitialised extends ContainerBlocState {
  final String token;
  ContainerInitialised(this.token);
}

class ContainerNotInitialised extends ContainerBlocState {}
