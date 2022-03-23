import 'package:break_clean/core/const/strings.dart';
import 'package:break_clean/core/error/failures.dart';
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
    characterBloc = CharacterBloc();


  });
  test('init state should be empty', ()async*{
    expect(characterBloc.initialState, equals(CharactersBloc()));
  });

          group('Get AllCharacter', () {
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

            test('should get data from the get all usecase', () async* {
              //arrange
              when(mockGetAllCharacter(any))
                  .thenAnswer((_) async => Right(characterTest));
              //act
                        characterBloc.add(GetAllCharacterEvent());
              await untilCalled(mockGetAllCharacter(any));

              //assert
              verify(mockGetAllCharacter(NoParams()));
            });
            test('should emits [Loading, Loaded] when data is gotten successfully',
                    () async* {
                  //arrange
                  when(mockGetAllCharacter(any))
                      .thenAnswer((_) async => Right(characterTest));

                  //assert later
                  final expeted = [CharactersBloc(), Loading(), Loaded(characterTest)];
                  expectLater(characterBloc, emitsInOrder(expeted));
                  //act
                  characterBloc.add(GetAllCharacterEvent());
                });
            test('should emits [Loading, Error] when getting data fails', () async* {
              //arrange
              when(mockGetAllCharacter(any))
                  .thenAnswer((_) async => Left(ServerFailure()));

              //assert later
              final expeted = [
                CharactersBloc(),
                Loading(),
                Error(message: SERVER_FAILURE_MESSAGE)
              ];
              expectLater(characterBloc, emitsInOrder(expeted));
              //act
              characterBloc.add(GetAllCharacterEvent());
            });

            test(
                'should emits [Loading, Error] with a proper message for the error when getting data fails',
                    () async* {
                  //arrange
                  when(mockGetAllCharacter(any))
                      .thenAnswer((_) async => Left(CacheFailure()));

                  //assert later
                  final expeted = [
                    CharactersBloc(),
                    Loading(),
                    Error(message: CACHE_FAILURE_MESSAGE)
                  ];
                  expectLater(characterBloc, emitsInOrder(expeted));
                  //act
                  characterBloc.add(GetAllCharacterEvent());
                });
          });

}