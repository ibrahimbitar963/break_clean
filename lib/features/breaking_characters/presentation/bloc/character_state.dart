part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  @override
  CharacterState([List props = const <dynamic>[]]):super();

  List<Object?> get props => throw UnimplementedError();
}

class CharactersBloc extends CharacterState {
  List<CharacterModel> characters = [];
}
class Loading extends CharacterState {}
class Loaded extends CharacterState {


  List<Character> characters = [];
  Loaded( this.characters, {character}):super([characters]);
}
class Error extends CharacterState{

  late final String message;
  Error({ required this.message}):super([message]);

}


