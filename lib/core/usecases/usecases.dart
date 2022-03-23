import 'package:dartz/dartz.dart';
import 'package:break_clean/core/error/failures.dart';
import 'package:equatable/equatable.dart';

    ///call methode in dart is used to run the class methode like object.call
    /// Parameters have to be put into a container object so that they can be
    /// included in this abstract base class method definition.

abstract class UseCase<Type, Params> {
  Future<Either<Failure, dynamic>> call(Params params);

    /// This will be used by the code calling the use case whenever the use case
    /// doesn't accept any parameters.
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}