import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:equatable/equatable.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {

        CharacterState get initialState => Empty();
        final GetAllCharacter getAllCharacter;
        //  List<Character> character=[];
          CharacterBloc({required this.getAllCharacter }) : super(Empty())  {

          on<CharacterEvent>((event, emit) {
          // TODO: implement event handler
    });
  }
}
