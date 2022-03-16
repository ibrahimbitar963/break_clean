import 'package:dartz/dartz.dart';
import 'package:break_clean/core/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, dynamic>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}