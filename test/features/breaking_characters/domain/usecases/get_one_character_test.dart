import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_one_character.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockOneCharacter extends Mock
implements CharactersRepository{}
 void main(){
   GetOneCharacter usecase;
   late MockOneCharacter mockOneCharacter;

setUp((){
  mockOneCharacter = MockOneCharacter();
  usecase = GetOneCharacter(MockOneCharacter());
});
final  characterId = 1;
final characterTest= Character(actorName: 'brayan', char_Id: 1, nickName: 'hisenberg');


test('should get one character',
    ()async{


        when(mockOneCharacter.getOneCharacters(1)).thenAnswer((_) async=>Right(characterTest) );
        final result = await usecase.execute(char_Id:characterId);


    }


);
 }



