part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
  @override
  List<Object> get props => [];
}

class GetAllCharacterevent extends CharacterEvent{
  // late final Character character;
  // getAllCharacter({required this.character});
}


