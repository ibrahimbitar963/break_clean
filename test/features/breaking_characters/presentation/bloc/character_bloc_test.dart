

import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../domain/usecases/get_all_characters_test.dart';

@GenerateMocks([CharactersRepository])
class MockCharacterBloc extends Mock implements CharacterBloc{}
class MockGetAllCharacter extends Mock implements GetAllCharacter{}
 class MockCharacterRepository extends Mock implements CharactersRepository{}


      void main(){
          late   GetAllCharacter getAllCharacter;
          late MockCharacterRepository mockCharacterRepository;
          late  CharacterBloc characterBloc;
          late MockCharacterBloc mockCharacterBloc;
          late   MockGetAllCharacter mockGetAllCharacter;
           CharactersRepository charactersRepository;


  setUp((){

    mockGetAllCharacter = MockGetAllCharacter();
    characterBloc = CharacterBloc(getAllCharacter:mockGetAllCharacter );


  });

}