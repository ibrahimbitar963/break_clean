part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
  @override
  List<Object> get props => [];
}

class GetAllCharacterEvent extends CharacterEvent{

}

class LoadingEvent extends CharacterEvent{}


