import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/getCharacters.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

@GenerateMocks([MockCharactersRepository])
void main() {
  late GetCharacters usecase;
  late MockCharactersRepository mockCharactersRepository;

  setUp(() {
    mockCharactersRepository = MockCharactersRepository();
    usecase = GetCharacters(mockCharactersRepository);
  });
  final tCharacter = Character(
      actorName: 'Bryan Cranston',
      appearance: [1, 2, 3, 4, 5],
      better_call_saul_appearance: [],
      char_Id: 1,
      image:
          'https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg',
      jobs: ['High School Chemistry Teacher', 'Meth King Pin'],
      nickName: 'Walter White',
      statusIfDeadOrAlive: 'Presumed dead');

  test(
    'should get character from repository',
    () async {
      //arrange
      when(mockCharactersRepository.getCharacters())
          .thenAnswer((_) async => Right(tCharacter));
      //act
      final result = await usecase(NoParams());
      //assert
      // expect(result, Right);
      //assert

      expect(result, Right(tCharacter));
      verify(mockCharactersRepository.getCharacters());
      verifyNoMoreInteractions(mockCharactersRepository);
    },
  );
}
