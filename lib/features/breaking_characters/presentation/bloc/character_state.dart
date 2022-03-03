part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  @override
  CharacterState([List props = const <dynamic>[]]):super();

  List<Object?> get props => throw UnimplementedError();
}

class Empty extends CharacterState {

}
class Loading extends CharacterState {}
class CharachtersLoaded extends CharacterState {

  late final List<Character> character;
  CharachtersLoaded({required this.character}):super([character]);
}
class Error extends CharacterState{

  late final String message;
  Error({ required this.message}):super([message]);

}


