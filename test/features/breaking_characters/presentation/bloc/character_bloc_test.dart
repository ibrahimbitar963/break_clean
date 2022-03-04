import 'package:break_clean/core/usecases/usecases.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/domain/repositories/characters_repository.dart';
import 'package:break_clean/features/breaking_characters/domain/usecases/get_all_characters.dart';
import 'package:break_clean/features/breaking_characters/presentation/bloc/character_bloc.dart';


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../domain/usecases/get_all_characters_test.dart';

@GenerateMocks([CharactersRepository])
class MockCharacterBloc extends Mock implements CharacterBloc{}
class MockGetAllCharacter extends Mock implements GetAllCharacter{}
 class MockCharacterRepository extends Mock implements CharactersRepository{}


      void main(){

          late MockCharacterRepository mockCharacterRepository;
          late  CharacterBloc characterBloc;
          late MockCharacterBloc mockCharacterBloc;
          late   MockGetAllCharacter mockGetAllCharacter;
           CharactersRepository charactersRepository;


  setUp((){

    mockGetAllCharacter = MockGetAllCharacter();
    characterBloc = CharacterBloc(getAllCharacter:mockGetAllCharacter );


  });
  test('init state should be empty', ()async*{
    expect(characterBloc.initialState, equals(Empty()));
  });

          group('Get AllCharacter', () {
            final tCharacter = CharacterModel(char_Id: 1, nickName: 'walter white', actorName: 'brayan cranston');

            test('should get data from the get all usecase', () async* {
              //arrange
              when(mockGetAllCharacter(any))
                  .thenAnswer((_) async => Right(tCharacter));
              //act
                        characterBloc.add(GetAllCharacterevent());
              await untilCalled(mockGetAllCharacter(any));

              //assert
              verify(mockGetAllCharacter(NoParams()));
            });
            test('should emits [Loading, Loaded] when data is gotten successfully',
                    () async* {
                  //arrange
                  when(mockGetAllCharacter(any))
                      .thenAnswer((_) async => Right(tCharacter));

                  //assert later
                  final expeted = [Empty(), Loading(), Loaded(character: tCharacter)];
                  expectLater(characterBloc, emitsInOrder(expeted));
                  //act
                  characterBloc.add(GetAllCharacterevent());
                });
            // test('should emits [Loading, Error] when getting data fails', () async* {
            //   //arrange
            //   when(mockGetRandomNumberTrivia(any))
            //       .thenAnswer((_) async => Left(ServerFailure()));
            //
            //   //assert later
            //   final expeted = [
            //     Empty(),
            //     Loading(),
            //     Error(message: SERVER_FAILURE_MESSAGE)
            //   ];
            //   expectLater(bloc, emitsInOrder(expeted));
            //   //act
            //   bloc.add(GetTriviaForRandomNumber());
            // });
            //
            // test(
            //     'should emits [Loading, Error] with a proper message for the error when getting data fails',
            //         () async* {
            //       //arrange
            //       when(mockGetRandomNumberTrivia(any))
            //           .thenAnswer((_) async => Left(CacheFailure()));
            //
            //       //assert later
            //       final expeted = [
            //         Empty(),
            //         Loading(),
            //         Error(message: CACHE_FAILURE_MESSAGE)
            //       ];
            //       expectLater(bloc, emitsInOrder(expeted));
            //       //act
            //       bloc.add(GetTriviaForRandomNumber());
            //     });
          });

}