import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
///test will ensure that the Repository is actually called
///and that the data simply passes unchanged throught the Use Case.
class MockCharacter extends Mock implements CharactersRepository {}

@GenerateMocks([CharactersRepository])
void main() {
  late GetAllCharacter usecase;
  late MockCharacter mockCharacter;

  setUp(() {
    mockCharacter = MockCharacter();
    usecase = GetAllCharacter(MockCharacter());
  });
  List<CharacterModel> characterTest =[ CharacterModel(
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
  )];

  test('should get character', () async* {

    /// "On the fly" implementation of the Repository using the Mockito package.
    /// When getAllCharacters is called, always answer with -
    /// the Right "side" of Either containing a test List of CharacterModel.
    when(mockCharacter.getAllCharacters())
    // ignore: non_constant_identifier_names
        .thenAnswer((MockOneCharacter) async => Right(characterTest));
    /// The "act" phase of the test. Call getAllCharacter method.
    final result = await usecase(NoParams());
    /// UseCase should simply return whatever was returned from the Repository
    expect(result, Right(characterTest));
    /// Verify that the method has been called on the Repository
    verify(mockCharacter.getAllCharacters());
    /// Only the above method should be called and nothing more.

    verifyNoMoreInteractions(mockCharacter);
  });
}
