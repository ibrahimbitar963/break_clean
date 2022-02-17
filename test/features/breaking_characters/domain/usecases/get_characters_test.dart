// import 'package:break_clean/core/usecases/usecases.dart';
// import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
// import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
// import 'package:break_clean/features/breaking_characters/domain/usecases/getCharacters.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// class MockCharactersRepository extends Mock implements CharactersRepository {}

// @GenerateMocks([MockCharactersRepository])
// void main() {
//   late GetCharacters usecase;
//   late MockCharactersRepository mockCharactersRepository;

//   setUp(() {
//     mockCharactersRepository = MockCharactersRepository();
//     usecase = GetCharacters(mockCharactersRepository);
//   });
//   final tCharacter = Character(
//       actorName: 'Bryan Cranston',
//       char_Id: 1,
//       nickName: 'Walter White',
//       );

//   test(
//     'should get character from repository',
//     () async {
//       //arrange
//       when(mockCharactersRepository.getOneCharacters())
//           .thenAnswer(() async => Right(tCharacter));
//       //act
//       final result = await usecase(NoParams());
//       //assert
//       // expect(result, Right);
//       //assert

//       expect(result, Right(tCharacter));
//       verify(mockCharactersRepository.getOneCharacters());
//       verifyNoMoreInteractions(mockCharactersRepository);
//     },
//   );
// }
