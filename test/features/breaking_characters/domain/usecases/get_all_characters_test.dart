import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_one_character.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCharacter extends Mock implements CharactersRepository {}

@GenerateMocks([CharactersRepository])
void main() {
  late GetAllCharacter usecase;
  late MockCharacter mockCharacter;

  setUp(() {
    mockCharacter = MockCharacter();
    usecase = GetAllCharacter(MockCharacter());
  });
  final characterTest =
  Character(actorName: 'brayan', char_Id: 1, nickName: 'hisenberg');

  test('should get character', () async* {
    when(mockCharacter.getAllCharacters())
    // ignore: non_constant_identifier_names
        .thenAnswer((MockOneCharacter) async => Right(characterTest));
    final result = await usecase(NoParams());
    expect(result, Right(characterTest));
    verify(mockCharacter.getAllCharacters());
    verifyNoMoreInteractions(mockCharacter);
  });
}
