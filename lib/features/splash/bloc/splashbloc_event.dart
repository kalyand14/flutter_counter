import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SplashblocEvent extends Equatable {
  SplashblocEvent([List props = const <dynamic>[]]) : super(props);
}

class InitialiseContainer extends SplashblocEvent {}
