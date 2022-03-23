import 'package:equatable/equatable.dart';

///The one base abstract Failure class from which any concrete failure will be derived.
abstract class  Failure extends Equatable{

  /// If the subclasses have some properties, they'll get passed to this constructor
  /// so that Equatable can perform value comparison.
  List<Object> get props => [];

}

class ServerFailure extends Failure{}

class CacheFailure extends Failure{}