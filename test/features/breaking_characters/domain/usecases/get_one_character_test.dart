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
  late GetOneCharacter useCase;
  late MockCharacter mockCharacter;

  setUp(() {
    mockCharacter = MockCharacter();
    useCase = GetOneCharacter(MockCharacter());
  });
  final characterId = 1;
 final characterTest= Character(
      charID: 1, nickName: 'Walter White', actorName: 'Heisenberg',
      image: 'https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg',
      jobs:[
        "High School Chemistry Teacher",
        "Meth King Pin"
      ],
      appearance:  [
        1,
        2,
        3,
        4,
        5
      ],
      category: 'Breaking Bad',
      betterCallSaulAppearance: [],
      statusIfDeadOrAlive: 'Presumed dead'

  );

  test('should get one character', () async* {
    when(mockCharacter.getOneCharacter(any))

        .thenAnswer((_) async => Right(characterTest));
    final result = await useCase(Params(charId:characterId));
    expect(result, Right(characterTest));
    verify(mockCharacter.getOneCharacter(characterId));
    verifyNoMoreInteractions(mockCharacter);
  });
}
