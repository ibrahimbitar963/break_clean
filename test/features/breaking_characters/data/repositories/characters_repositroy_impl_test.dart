import 'package:break_clean/core/error/exception.dart';
import 'package:break_clean/core/error/failures.dart';
import 'package:break_clean/core/network/network_info.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_local_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/datasources/character_remote_data_source.dart';
import 'package:break_clean/features/breaking_characters/data/models/character_model.dart';
import 'package:break_clean/features/breaking_characters/data/repositories/character_repository_impl.dart';
import 'package:break_clean/features/breaking_characters/domain/entites/character.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockLocalDataSource extends Mock implements CharacterLocalDataSource {}

class MockRemoteDataSource extends Mock implements CharacterRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([NetworkInfo])
@GenerateMocks([CharacterRemoteDataSource])
void main() {
  late CharacterRepositoryImpl repositoryImpl;
  late MockLocalDataSource mockLocalDataSource;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = CharacterRepositoryImpl(localDataSource: mockLocalDataSource, networkInfo: mockNetworkInfo, remoteDataSource: mockRemoteDataSource,);
  });
  group('get character', () {
    final tCharacterNumber = 1;
    final tCharacterModel =CharacterModel(
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

    final Character tCharacter = tCharacterModel;
    test('check if the device online', () async* {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repositoryImpl.getOneCharacter(tCharacterNumber);
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is success ',
              () async {
            when(mockRemoteDataSource.getOneCharacter(tCharacterNumber))
                .thenAnswer((_) async => tCharacterModel);

            final result = await repositoryImpl.getOneCharacter(tCharacterNumber);
            verify(mockRemoteDataSource.getOneCharacter(tCharacterNumber));
            expect(result, equals(Right(tCharacter)));
          });
      test(
          'should cache the data locally when the call to remote data source is success ',
              () async {
            when(mockRemoteDataSource.getOneCharacter(tCharacterNumber))
                .thenAnswer((_) async => tCharacterModel);

            await repositoryImpl.getOneCharacter(tCharacterNumber);
            verify(mockRemoteDataSource.getOneCharacter(tCharacterNumber));
            verify(mockLocalDataSource.cachedCharacter(tCharacterModel));
          });
      test(
          'should return server failure data when the call to remote data source is unsuccessful ',
              () async {
            when(mockRemoteDataSource.getOneCharacter(tCharacterNumber))
                .thenThrow(ServerException());

            final result = await repositoryImpl.getOneCharacter(tCharacterNumber);
            verify(mockRemoteDataSource.getOneCharacter(tCharacterNumber));
            verifyNoMoreInteractions(mockLocalDataSource);
            expect(result, equals(Left(ServerFailure())));
          });
    });
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      // test(
      //     'should return last locally cached data when the cached data is present  ',
      //     () async {
      //   when(mockLocalDataSource.getLastCharacter())
      //       .thenAnswer((_) async => tCharacterModel);
      //   final result = repositoryImpl.getOneCharacters(tCharacterNumber);
      //   //   verifyNoMoreInteractions(mockRemoteDataSource);
      //   verify(mockLocalDataSource.getLastCharacter());
      //   expect(result, Right(tCharacterNumber));
      // });
    });
  });
}

// group('device online', ()async* {
//
//     when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//   test('should get data if the device is online', () async* {
//     when(mockRemoteDataSource.getOneCharacters(tCharacterNumber))
//         .thenAnswer((_) async => tCharacterModel);
//     final result = await repositoryImpl.getOneCharacters(tCharacterNumber);
//     expect(result, equals(Right(tCharacter)));
//     verify(mockRemoteDataSource.getOneCharacters(tCharacterNumber));
//   });
// });

//     group('device offline', () {
//       setUp(() {
//         when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
// // test(description, body)
//       });
//     });
//     test('should check if the device is online', () async {
//       //arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       //act
//       repositoryImpl.getOneCharacters(tCharacterNumber);
//       //assert
//       verify(mockNetworkInfo.isConnected);
//     });
