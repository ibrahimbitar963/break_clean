import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_one_character.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCharacter extends Mock implements CharactersRepository {}

@GenerateMocks([CharactersRepository])
void main() {
  late GetOneCharacter usecase;
  late MockCharacter mockCharacter;

  setUp(() {
    mockCharacter = MockCharacter();
    usecase = GetOneCharacter(MockCharacter());
  });
  final characterId = 1;
  final characterTest =
      Character(actorName: 'brayan', char_Id: 1, nickName: 'hisenberg');

  test('should get one character', () async* {
    when(mockCharacter.getOneCharacters(characterId))
        // ignore: non_constant_identifier_names
        .thenAnswer((MockOneCharacter) async => Right(characterTest));
    final result = await usecase(Params(charId:characterId));
    expect(result, Right(characterTest));
    verify(mockCharacter.getOneCharacters(characterId));
    verifyNoMoreInteractions(mockCharacter);
  });
}
