import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SplashblocState extends Equatable {
  SplashblocState([List props = const <dynamic>[]]) : super(props);
}

class ContainerUnInitialised extends SplashblocState {}

class InitialingContainer extends SplashblocState {}

class ContainerInitialised extends SplashblocState {
  final String token;
  ContainerInitialised(this.token);
}

class ContainerNotInitialised extends SplashblocState {}
